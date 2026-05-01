import 'dart:math';

import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/level_selection/levels.dart';
import 'package:basic/math/constant_vector.dart';
import 'package:logging/logging.dart';

/// Randomly generate a level from given parameters.
class LevelGenerator {

  LevelGenerator();

  GameLevel generateLevel({required int width, required int height, required int difficulty}) {
    
    final log = Logger('LevelGenerator');
    assert(difficulty >= 0 && difficulty <= 100);

    // favor taller levels over wider ones since we're assuming portrait mode on a phone
    if (width > height) {
      int temp = width;
      width = height;
      height = temp;
    }

    int totalTiles = width * height;
    List<int> tiles = List.filled(totalTiles, 0);
    List<int> bombs = [];
    List<int> remainingIndexes = List.generate(totalTiles, (index) => index);
    List<int> filledTiles = [];
    Map<int, List<Grant>> rewards = {};
    remainingIndexes.shuffle();
    int numTiles = max(((100-difficulty)/100) * totalTiles, 3).toInt();
    int numBombs = max((difficulty / 150) * totalTiles, 1).toInt();
    log.info("Generating level of size $totalTiles tiles and difficulty $difficulty with $numTiles filled and $numBombs bombs");

    for(int i = 0; i < numTiles; i++) {
      int index = remainingIndexes.removeLast();
      tiles[index] = 1;
      filledTiles.add(index);
    }

    for(int i = 0; i < numBombs; i++) {
      int index = remainingIndexes.removeLast();
      bombs.add(index);
    }

    for(int index in filledTiles) {
      rewards[index] ??= [];
      // todo: replace with loot table logic that scales with difficulty/world
      rewards[index]!.add(Grant(
        type: GrantType.GrantType_Resource,
        id: 'resource_coin', 
        amount: 1
      ));
    }

    var level = GameLevel(
      size: ConstantVector2(width, height),
      tiles: tiles,
      bombs: bombs,
      rewards: rewards
    );

    // debug log level
    for(int i = 0; i < height; i++){
      String row = "";
      for(int j = 0; j < width; j++) {
        row += "${tiles[i*width + j]}, ";
      }
      log.info(row);
    }

    log.info("Bombs: ${level.bombs}");    

    return level;
  }

}
