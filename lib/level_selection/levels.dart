// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/math/constant_vector.dart';

class ClueData
{
  ClueData(this.tileClues, this.bombCount);

  final List<int> tileClues;
  final int bombCount;
}

// config data for a level
class GameLevel {
  final ConstantVector2<int> size;
  final List<int> tiles;
  final List<int> bombs; // location of bomb tiles by index
  final Map<int, List<Grant>> rewards; // locations of rewards

  const GameLevel({
    required this.size,
    required this.tiles,
    required this.bombs,
    required this.rewards
  });

  ClueData getClueForRow(int row) {
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

    if (clues.isEmpty)
    {
      clues.add(0);
    }

    // get bombs in row
    int bombCount = 0;
    for (int i = startingIndex; i < startingIndex + size.x; i++) {
      if (bombs.contains(i)){
        bombCount++;
      }
    }

    return ClueData(clues, bombCount);
  }

  ClueData getClueForColumn(int column) {
    int startingIndex = column;
    List<int> cluesRaw = [];
    List<int> clues = [];

    int bombCount = 0;
    for (int i = 0; i < size.y; i++) {
      cluesRaw.add(tiles[startingIndex + i * size.x]);
      if (bombs.contains(startingIndex + i * size.x)){
        bombCount++;
      }
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

    // add the final clue if the column ends with a clue
    if (currentClue!= 0) {
      clues.add(currentClue);
    }

    if (clues.isEmpty)
    {
      clues.add(0);
    }

    return ClueData(clues, bombCount);
  }
}
