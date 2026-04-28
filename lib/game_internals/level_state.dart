// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/level_selection/levels.dart';
import 'package:flutter/foundation.dart';

/// State for the active picross puzzle.
///
/// Tracks which tiles have been revealed by the player and whether the player has won yet
class LevelState extends ChangeNotifier {
  final VoidCallback onWin;
  final VoidCallback onLose;
  final GameLevel level;
  final int playerLives;

  LevelState({required this.level, required this.onWin, required this.onLose, required this.playerLives});

  List<int> revealedTiles = [];
  Map<int, bool> markedTiles = {};
  int bombsRevealedCount = 0;

  void revealTile(int index) {
    revealedTiles.add(index);
    _updateBombCounter(index);
    _checkLose();
    _checkWin();
    notifyListeners();
  }

  void toggleMarking(int index) {
    // todo: convert to set of flags (bitwise) to support multiple flag types
    bool isMarked = markedTiles[index] == true;
    markedTiles[index] = !isMarked;
    notifyListeners();
  }

  bool isTileMarked(int index) {
    return markedTiles[index] == true;
  }

  int getLivesRemaining() {
    return playerLives - bombsRevealedCount;
  }

  void _updateBombCounter(int index) {
    if (level.bombs.contains(index)) {
        bombsRevealedCount++;
      }
  }

  void _checkLose() {
    // check if bomb count surpassed player's lives count
    if (bombsRevealedCount < playerLives) {
      return;
    }
    
    // lose if all bombs revealed
    onLose();
  }

  void _checkWin() {
    for (int i = 0; i < level.tiles.length; i++) {
      if (level.tiles[i] > 0 && !revealedTiles.contains(i)) {
        return;
      }
    }
    onWin();
  }

  void _onPlayerWin() {
        
  }
}
