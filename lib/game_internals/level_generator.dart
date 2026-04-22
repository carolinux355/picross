import 'package:basic/level_selection/levels.dart';
import 'package:basic/math/constant_vector.dart';
import 'package:logging/logging.dart';

/// Randomly generate a level from given parameters.
class LevelGenerator {

  LevelGenerator();

  GameLevel generateLevel({required int width, required int height, required int difficulty}) {
    
    final _log = Logger('LevelGenerator');
    assert(difficulty >= 0 && difficulty <= 100);

    int totalTiles = width * height;
    List<int> tiles = List.filled(totalTiles, 0);
    List<int> bombs = [];
    List<int> remainingIndexes = List.generate(totalTiles, (index) => index);
    remainingIndexes.shuffle();
    int numTiles = (((100-difficulty)/100) * totalTiles).toInt();
    int numBombs = ((difficulty / 200) * totalTiles).toInt();
    _log.info("Generating level of size $totalTiles tiles and difficulty $difficulty with $numTiles filled and $numBombs bombs");

    for(int i = 0; i < numTiles; i++) {
      int index = remainingIndexes.removeLast();
      tiles[index] = 1;
    }

    for(int i = 0; i < numBombs; i++) {
      int index = remainingIndexes.removeLast();
      bombs.add(index);
    }

    var level = GameLevel(
      number: -1,
      levelId: "generated",
      size: ConstantVector2(width, height),
      tiles: tiles,
      bombs: bombs,
    );

    // debug log level
    for(int i = 0; i < height; i++){
      String row = "";
      for(int j = 0; j < width; j++) {
        row += "${tiles[i*width + j]}, ";
      }
      _log.info(row);
    }

    _log.info("Bombs: ${level.bombs}");

    return level;
  }

}
