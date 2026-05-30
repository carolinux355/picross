
import 'package:basic/generated/persistence/PersistedLevelState.pb.dart';

class ClueData
{
  ClueData(this.tileClues);
  final List<int> tileClues;
}

// config data for a level
class ClueProvider {
  final PersistedLevelState levelState;

  ClueProvider({
    required this.levelState
  });

  ClueData getClueForRow(int row) {
    int startingIndex = row * levelState.size.x;
    List<int> cluesRaw = levelState.tiles.getRange(startingIndex, startingIndex + levelState.size.x).toList();
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

    return ClueData(clues);
  }

  ClueData getClueForColumn(int column) {
    int startingIndex = column;
    List<int> cluesRaw = [];
    List<int> clues = [];

    for (int i = 0; i < levelState.size.y; i++) {
      cluesRaw.add(levelState.tiles[startingIndex + i * levelState.size.x]);
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

    return ClueData(clues);
  }
}
