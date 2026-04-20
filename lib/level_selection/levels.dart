// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/math/constant_vector.dart';

// some placeholder levels hardcoded for now, todo: migrate to a config file and read from disc
const gameLevels = [
  GameLevel(
    number: 1,
    levelId: "1",
    size: ConstantVector2(6,5),
    tiles: [0,0,0,0,0,0,
            0,1,1,1,0,0,
            0,1,0,1,0,1,
            0,1,1,1,0,0,
            0,0,0,0,0,0]
  ),
];

class GameLevel {
  final int number; // indexing for player progres, may change logic to unlock levels in batches later
  final String levelId; // more flexible identifier for the level in case order changes
  final ConstantVector2<int> size;
  final List<int> tiles;

  const GameLevel({
    required this.number,
    required this.levelId,
    required this.size,
    required this.tiles
  });

  List<int> getClueForRow(int row) {
    int startingIndex = row * size.x;
    List<int> cluesRaw = tiles.getRange(startingIndex, startingIndex + size.x).toList();
    List<int> clues = [];

    // convert the raw tile data into clue data by counting consecutive 1s and adding to the clue list
    int currentClue = 0;
    for(var clue in cluesRaw) {
      if (clue > 0) {
        currentClue += clue;
      } 
      else {
        if(currentClue != 0) {
          clues.add(currentClue);
          currentClue = 0;
        }
      }
    }
    
    // add the final clue if the row ends with a clue
    if (currentClue!= 0) {
      clues.add(currentClue);
    }
    return clues;
  }

  List<int> getClueForColumn(int column) {
    int startingIndex = column;
    List<int> cluesRaw = [];
    List<int> clues = [];

    for (int i = 0; i < size.y; i++) {
      cluesRaw.add(tiles[startingIndex + i * size.x]);
    }

    // convert the raw tile data into clue data by counting consecutive 1s and adding to the clue list
    int currentClue = 0;
    for(var clue in cluesRaw) {
      if (clue > 0) {
        currentClue += clue;
      } 
      else {
        if(currentClue != 0) {
          clues.add(currentClue);
          currentClue = 0;
        }
      }
    }

    return clues;
  }
}
