import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/score.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/level_selection/levels.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/settings/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// State for the active picross puzzle.
///
/// Tracks which tiles have been revealed by the player and whether the player has won yet
class LevelState extends ChangeNotifier {
  final Function(LevelCompleteState) onWin;
  final VoidCallback onLose;
  final GameLevel level;
  final SettingsController settingsController;
  final GrantManager grantManager;
  final GameStateManager gameStateManager;
  final GameDataManager gameDataManager;
  final PlayerLivesManager playerLivesManager;

  final Logger logger = Logger('LevelState');

  LevelState({
    required this.level, 
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

  late DateTime _startOfPlay;
  final List<int> revealedTiles = [];
  final Map<int, bool> _markedTiles = {};
  final List<int> disabledTiles = [];
  List<Grant> pendingRewards = [];

  void _initialize() {
    _startOfPlay = DateTime.now();
    _checkAutoFill();
    notifyListeners();
  }

  void revealTile(int index) {
    if (disabledTiles.contains(index)) {
      return;
    }
    revealedTiles.add(index);
    _grantPendingRewards(index);
    _updateBombCounter(index);
    _checkLose();
    _checkWin();
    _checkAutoFill();
    notifyListeners();
  }

  void toggleMarking(int index) {
    // todo: convert to set of flags (bitwise) to support multiple flag types
    bool isMarked = _markedTiles[index] == true;
    _markedTiles[index] = !isMarked;
    notifyListeners();
  }

  bool isTileMarked(int index) {
    return _markedTiles[index] == true;
  }

  int getLivesRemaining() {
    return playerLivesManager.getLives();
  }

  Grant? getRewardPreviewAtIndex(int index) {
    if (level.rewards.containsKey(index) && level.rewards[index]!.isNotEmpty) {
      return level.rewards[index]?[0];
    }
    return null;
  }

  void _grantPendingRewards(int index) {
    // todo: persist and save in case game crashes
    if (level.rewards.containsKey(index)) {
      pendingRewards.addAll(level.rewards[index]!);
    }
  }

  void _flushPendingRewards() {
    grantManager.tryGrantList(pendingRewards);
    pendingRewards.clear();
    notifyListeners();
  }

  void _updateBombCounter(int index) {
    if (level.bombs.contains(index)) {
      // take away a player life
      playerLivesManager.removeLives(1);
    }
  }

  void _checkLose() {
    // check if player out of lives
    if (playerLivesManager.getLives() <= 0) {
      onLose();
    }
  }

  void _checkWin() {
    for (int i = 0; i < level.tiles.length; i++) {
      if (level.tiles[i] > 0 && !revealedTiles.contains(i)) {
        // not yet won
        return;
      }
    }

    // process win
    final score = Score(
      DateTime.now().difference(_startOfPlay),
    );

    pendingRewards = grantManager.consolidateGrants(pendingRewards);
    pendingRewards.add(Grant(
      type: GrantType.GrantType_Xp,
      id: gameDataManager.getTuning().xpResourceId,
      amount: 5,
    ));

    LevelCompleteState levelCompleteState = LevelCompleteState(rewards: List.from(pendingRewards), score: score, worldId: level.worldId);

    // todo: prefer to write to save data in a model class not here but ok for now
    var gameState = gameStateManager.gameState;
    gameState.numLevelsPlayed++;

    // grant rewards
    _flushPendingRewards();

    gameStateManager.save();

    // callback to view
    onWin(levelCompleteState);
  }

  // returns list of blank tiles to disable
  List<int>? _checkRowForAutofill(int index) {
    int startingIndex = index * level.size.x;
    List<int> indices = [];
    for (int i = startingIndex; i < startingIndex + level.size.x; i++) {
      indices.add(i);
    }
    List<int> blankTiles = [];
    for (int i = 0; i < indices.length; i++) {
      var tile = level.tiles[indices[i]];
      // if blank track that
      // if filled check if user has revealed it
      if (tile == 0) {
        blankTiles.add(indices[i]);
      } else {
        if (!revealedTiles.contains(indices[i])) {
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
    for (int i = 0; i < level.size.y; i++) {
      tiles.add(startingIndex + i * level.size.x);
    }
    for (int i = 0; i < tiles.length; i++) {
      var tile = level.tiles[tiles[i]];
      if (tile == 0) {
        blankTiles.add(tiles[i]);
      } else {
        if (!revealedTiles.contains(tiles[i])) {
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
    for (int i = 0; i < level.size.y; i++){
      var tilesToFill = _checkRowForAutofill(i);
      if (tilesToFill != null && tilesToFill.isNotEmpty) {
        for (var tile in tilesToFill) {
          if (!disabledTiles.contains(tile)) {
            disabledTiles.add(tile);
          }
        }
      }
    }

    for (int i = 0; i < level.size.x; i++){
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
  final Score score;
  final String worldId;
  LevelCompleteState({required this.rewards, required this.score, required this.worldId});
}
