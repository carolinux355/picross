// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/play_session/play_session_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../audio/audio_controller.dart';
//import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class GameWidget extends StatelessWidget {
  const GameWidget({super.key, required this.playerSessionState});

  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {
    final level = context.watch<GameLevel>();
    final levelState = context.watch<LevelState>();

    return PicrossGrid(level: level, levelState: levelState, playerSessionState: playerSessionState,);
  }
}

// draw the puzzle grid with clues and revealed/unrevealed tiles
class PicrossGrid extends StatelessWidget {
  const PicrossGrid({
    super.key,
    required this.level,
    required this.levelState,
    required this.playerSessionState,
  });

  final GameLevel level;
  final LevelState levelState;
  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 1,
              children: [
                for (int i = 0; i < level.size.x; i++)
                  VerticalClueWidget(clues: level.getClueForColumn(i)),
              ],
            ),
                  
            for (int i = 0; i < level.size.y; i++)
              PicrossRow(level: level, levelState: levelState, row: i, playerSessionState: playerSessionState,),
          ],
          ),
      ),
    );
  }
}

class PicrossRow extends StatelessWidget {
  const PicrossRow({
    super.key,
    required this.level,
    required this.levelState,
    required this.row,
    required this.playerSessionState,
  });

  final GameLevel level;
  final LevelState levelState;
  final int row;
  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            HorizontalClueWidget(clues: level.getClueForRow(row)),
            for (int j = 0; j < level.size.x; j++)
              PicrossCell(level: level, levelState: levelState, row: row, column: j, playerSessionState: playerSessionState,),
          ],
        ),
      ],
    );
  }
}

class HorizontalClueWidget extends StatelessWidget {
  const HorizontalClueWidget({
    super.key,
    required this.clues,
  });

  final List<int> clues;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onTertiary);

    return Container(
      child: Container(
        color: theme.colorScheme.tertiary,
        child: SizedBox(
          height: 50,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 1,
              children: [
                if (clues.isEmpty)
                  Text('0', textAlign: TextAlign.right, style: textTheme)
                else
                  for (var clue in clues)
                    Text(clue.toString(), textAlign: TextAlign.right, style: textTheme),
                ],
              ),
          ),
        ),
      )
    );
  }
}

class VerticalClueWidget extends StatelessWidget {
  const VerticalClueWidget({
    super.key,
    required this.clues,
  });

  final List<int> clues;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onTertiary);

    return Container(
      color: theme.colorScheme.tertiary,
      child: SizedBox(
        width: 50,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (clues.isEmpty)
                Text('0', textAlign: TextAlign.center, style: textTheme)
              else
                for (var clue in clues)
                  Text(clue.toString(), textAlign: TextAlign.center, style: textTheme),
              ],
            ),
        ),
      )
    );
  }
}

class PicrossCell extends StatelessWidget {
  const PicrossCell({
    super.key,
    required this.level,
    required this.levelState,
    required this.row,
    required this.column,
    required this.playerSessionState,
  });

  final GameLevel level;
  final LevelState levelState;
  final int row;
  final int column;
  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        color: Colors.grey,
        child: 
          Container(
            width: 49,
            height: 49,
            margin: const EdgeInsets.all(1),
            child: _drawTile(context,level,levelState),
          ),
      ),
    );
  }

  Widget _drawTile(BuildContext context, GameLevel level, LevelState levelState) {
    var theme = Theme.of(context);

    int index = row * level.size.x + column;
    if (levelState.revealedTiles.contains(index)) {
      // draw bomb state
      if (level.bombs.contains(index)){
        return Container(
          width: 49,
          height: 49,
          color: Colors.red,
          child: const Icon(Icons.warning, color: Colors.white,),
        );
      }

      // draw revealed tile
      return Container(
        width: 49,
        height: 49,
        color: level.tiles[index] > 0 ? Colors.black : Colors.white
      );
    }
    else {
      if (levelState.isTileMarked(index)) {
        // draw marked state
        return Container(
          width: 49,
          height: 49,
          color: theme.colorScheme.secondary
    ,
          child: Icon(Icons.flag),
        );
      }
      
      // draw hidden state
      return Container(
        width: 49,
        height: 49,
        color: theme.colorScheme.inversePrimary,
        child: Icon(Icons.help),);
    }
  }

  void _onTap(BuildContext context) {
    var levelState = context.read<LevelState>();
    int index = row * level.size.x + column;
    if (!levelState.revealedTiles.contains(index)) {
      switch(playerSessionState.getInputMode()) {

        case PlayerSessionInputMode.Reveal:
          levelState.revealTile(index);

        case PlayerSessionInputMode.Mark:
          levelState.toggleMarking(index);

      }
    }
  }
}
