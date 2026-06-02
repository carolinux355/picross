import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/generated/configuration/Utils.pb.dart';
import 'package:basic/generated/persistence/PersistedLevelState.pb.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/settings/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// Manage state for the active picross puzzle.
///
/// Tracks which tiles have been revealed by the player and whether the player has won yet
class LevelStateController extends ChangeNotifier {
  final Function(LevelCompleteState) onWin;
  final VoidCallback onLose;
  final SettingsController settingsController;
  final GrantManager grantManager;
  final GameStateManager gameStateManager;
  final GameDataManager gameDataManager;
  final PlayerLivesManager playerLivesManager;

  final Logger logger = Logger('LevelState');

  LevelStateController({
    required this.onWin, 
    required this.onLose, 
    required this.settingsController, 
    required this.grantManager, 
    required this.gameStateManager, 
    required this.gameDataManager,
    required this.playerLivesManager
  }) {
    _initialize();
  }

  ProtoVector2 size() => state.size;

  late PersistedLevelState state;

  Map<int, List<Grant>> rewards = {};
  List<int> bombs = [];

  final List<int> disabledTiles = [];

  void _initialize() {
    state = gameStateManager.gameState.persistedLevelState;
    for (var kvp in state.tileContents.entries) {
      if (kvp.value.isBomb) {
        bombs.add(kvp.key);
      }
      if (kvp.value.grants.isNotEmpty) {
        rewards[kvp.key] ??= [];
        rewards[kvp.key]!.addAll(kvp.value.grants);
      }
    }

    _checkAutoFill();
    notifyListeners();
  }

  void revealTile(int index) {
    if (disabledTiles.contains(index)) {
      return;
    }
    state.revealedTiles.add(index);
    _updateBombCounter(index);
    _checkLose();
    _checkWin();
    _checkAutoFill();
    gameStateManager.save();
    notifyListeners();
  }

  void toggleMarking(int index) {
    // todo: convert to set of flags (bitwise) to support multiple flag types
    bool isMarked = isTileMarked(index);
    if (isMarked) {
      state.markedTiles.remove(index);
    } else{
      state.markedTiles.add(index);
    }
    gameStateManager.save();
    notifyListeners();
  }

  bool isTileMarked(int index) {
    return state.markedTiles.contains(index);
  }

  int getLivesRemaining() {
    return playerLivesManager.getLives();
  }

  Grant? getRewardPreviewAtIndex(int index) {
    if (rewards.containsKey(index) && rewards[index]!.isNotEmpty) {
      return rewards[index]?[0];
    }
    return null;
  }

  void _updateBombCounter(int index) {
    if (bombs.contains(index)) {
      // take away a player life
      playerLivesManager.removeLives(1);
    }
  }

  void _checkLose() {
    // check if player out of lives
    if (playerLivesManager.getLives() <= 0) {
      // mark level as lost so we generate a new one
      gameStateManager.gameState.persistedLevelState.isComplete = true;
      gameStateManager.save();

      onLose();
    }
  }

  void _checkWin() {
    for (int i = 0; i < state.tiles.length; i++) {
      if (state.tiles[i] > 0 && !state.revealedTiles.contains(i)) {
        // not yet won
        return;
      }
    }

    var world = gameDataManager.getData(state.worldId);

    // consolidate all rewards earned
    List<Grant> pendingRewards = [];
    for(var kvp in state.tileContents.entries) {
      pendingRewards.addAll(kvp.value.grants);
    }    
    pendingRewards = grantManager.consolidateGrants(pendingRewards);

    bool perfectScore = true;
    if (state.revealedTiles.toSet().intersection(bombs.toSet()).isNotEmpty) {
      perfectScore = false;
    }

    int xp = world!.components.world.baseXp * state.difficulty + (perfectScore ? world.components.world.baseXp * gameDataManager.getTuning().perfectScoreXpBonus : 0);

    LevelCompleteState levelCompleteState = LevelCompleteState(rewards: List.from(pendingRewards), xpEarned: xp, worldId: state.worldId);

    pendingRewards.add(Grant(
      type: GrantType.GrantType_Xp,
      id: gameDataManager.getTuning().xpResourceId,
      amount: xp,
    ));

    var gameState = gameStateManager.gameState;
    gameState.numLevelsPlayed++;

    grantManager.tryGrantList(pendingRewards);
    // mark level complete so we generate a new one
    gameStateManager.gameState.persistedLevelState.isComplete = true;
    gameStateManager.save();

    // callback to view
    onWin(levelCompleteState);
  }

  // returns list of blank tiles to disable
  List<int>? _checkRowForAutofill(int index) {
    int startingIndex = index * state.size.x;
    List<int> indices = [];
    for (int i = startingIndex; i < startingIndex + state.size.x; i++) {
      indices.add(i);
    }
    List<int> blankTiles = [];
    for (int i = 0; i < indices.length; i++) {
      var tile = state.tiles[indices[i]];
      // if blank track that
      // if filled check if user has revealed it
      if (tile == 0) {
        blankTiles.add(indices[i]);
      } else {
        if (!state.revealedTiles.contains(indices[i])) {
          return null;
        }
      }
    }

    return blankTiles;
  }

  List<int>? _checkColumnForAutofill(int index) {
    List<int> blankTiles = [];
    List<int> tiles = [];
    int startingIndex = index;
    for (int i = 0; i < state.size.y; i++) {
      tiles.add(startingIndex + i * state.size.x);
    }
    for (int i = 0; i < tiles.length; i++) {
      var tile = state.tiles[tiles[i]];
      if (tile == 0) {
        blankTiles.add(tiles[i]);
      } else {
        if (!state.revealedTiles.contains(tiles[i])) {
          return null;
        }
      }
    }
    return blankTiles;
  }

  void _checkAutoFill() {
    if (!settingsController.autoFillOn.value) {
      return;
    }
    // try to auto mark tiles once a row or column is solved
    for (int i = 0; i < state.size.y; i++){
      var tilesToFill = _checkRowForAutofill(i);
      if (tilesToFill != null && tilesToFill.isNotEmpty) {
        for (var tile in tilesToFill) {
          if (!disabledTiles.contains(tile)) {
            disabledTiles.add(tile);
          }
        }
      }
    }

    for (int i = 0; i < state.size.x; i++){
      var tilesToFill = _checkColumnForAutofill(i);
      if (tilesToFill != null && tilesToFill.isNotEmpty) {
        for (var tile in tilesToFill) {
          if (!disabledTiles.contains(tile)) {
            disabledTiles.add(tile);
          }
        }
      }
    }
  }
}

class LevelCompleteState
{
  final List<Grant> rewards;
  final int xpEarned;
  final String worldId;
  LevelCompleteState({required this.rewards, required this.xpEarned, required this.worldId});
}
