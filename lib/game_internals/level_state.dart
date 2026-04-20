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
  final GameLevel level;

  LevelState({required this.level, required this.onWin});

  List<int> revealedTiles = [];

  void revealTile(int index) {
    revealedTiles.add(index);
    _checkWin();
    notifyListeners();
  }

  void _checkWin() {
    for (int i = 0; i < level.tiles.length; i++) {
      if (level.tiles[i] > 0 && !revealedTiles.contains(i)) {
        return;
      }
    }
    onWin();
  }
}
