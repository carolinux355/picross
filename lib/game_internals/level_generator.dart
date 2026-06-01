import 'dart:math';

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/generated/configuration/Utils.pb.dart';
import 'package:basic/generated/persistence/PersistedLevelState.pb.dart';
import 'package:basic/loot_tables/loot_table_manager.dart';
import 'package:logging/logging.dart';

/// Randomly generate a level from given parameters.
class LevelGenerator {

  LevelGenerator();

  Future<PersistedLevelState> generateLevel({required GameDataManager gameDataManager, required LootTableManager lootTableManager, required String worldId}) async {
    
    final log = Logger('LevelGenerator');
    final random = Random();

    var worldData = gameDataManager.getData(worldId);
    var difficultyConfig = worldData!.components.levelDifficulty;
    int width = random.nextInt(difficultyConfig.sizeRange.max - difficultyConfig.sizeRange.min) + difficultyConfig.sizeRange.min;
    int height = random.nextInt(difficultyConfig.sizeRange.max - difficultyConfig.sizeRange.min) + difficultyConfig.sizeRange.min;
    int difficulty = random.nextInt(difficultyConfig.difficultyRange.max - difficultyConfig.difficultyRange.min) + difficultyConfig.difficultyRange.min;

    assert(difficulty >= 0 && difficulty <= 100);

    // favor taller levels over wider ones since we're assuming portrait mode on a phone
    if (width > height) {
      int temp = width;
      width = height;
      height = temp;
    }

    int totalTiles = width * height;
    List<int> tiles = List.filled(totalTiles, 0);
    List<int> remainingIndexes = List.generate(totalTiles, (index) => index);
    List<int> filledTiles = [];
    Map<int, PersistedLevelTileContents> tileContents = {};

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
      tileContents[index] ??= PersistedLevelTileContents();
      tileContents[index]!.isBomb = true;
    }

    var lootTable = gameDataManager.getData(worldData.components.world.lootTableId)!.components.lootTable;
    for(int index in filledTiles) {
      tileContents[index] ??= PersistedLevelTileContents();
      tileContents[index]!.grants.addAll(lootTableManager.execute(lootTable));
    }

    var level = PersistedLevelState(
      size: ProtoVector2(x: width, y: height),
      difficulty: difficulty,
      tiles: tiles,
      tileContents: tileContents.entries,
      worldId: worldId,
      isComplete: false
    );

    return level;
  }

}
