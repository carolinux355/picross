// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/game_internals/score.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/level_selection/levels.dart';
import 'package:basic/persistence/game_state_manager.dart';
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
  final int playerLives;
  final SettingsController settingsController;
  final GrantManager grantManager;
  final GameStateManager gameStateManager;

  final Logger logger = Logger('LevelState');

  LevelState({required this.level, required this.onWin, required this.onLose, required this.playerLives, required this.settingsController, required this.grantManager, required this.gameStateManager}) {
    _initialize();
  }

  late DateTime _startOfPlay;
  final List<int> revealedTiles = [];
  final Map<int, bool> _markedTiles = {};
  int _bombsRevealedCount = 0;
  final List<int> disabledTiles = [];
  final List<Grant> pendingRewards = [];

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
    return playerLives - _bombsRevealedCount;
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
  }

  void _updateBombCounter(int index) {
    if (level.bombs.contains(index)) {
      _bombsRevealedCount++;
    }
  }

  void _checkLose() {
    // check if bomb count surpassed player's lives count
    if (_bombsRevealedCount < playerLives) {
      return;
    }
    
    // lose if all bombs revealed
    onLose();
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

    LevelCompleteState levelCompleteState = LevelCompleteState(rewards: grantManager.consolidateGrants(pendingRewards), score: score);

    // todo: prefer to write to save data in a model class not here but ok for now
    var gameState = gameStateManager.gameState;
    gameState.numLevelsPlayed++;
    gameState.xp += score.score;

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
        //logger.info('found complete row $i');
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
        //logger.info('found completed column $i');
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
  LevelCompleteState({required this.rewards, required this.score});
}
