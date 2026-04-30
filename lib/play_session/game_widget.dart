// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math';

import 'package:basic/play_session/game_gesture_manager.dart';
import 'package:basic/play_session/play_session_screen.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
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
    double cellSize = _calculateCellSize(context, level);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        PicrossGrid(level: level, levelState: levelState, playerSessionState: playerSessionState, cellSize: cellSize,),
        Spacer()
      ],
    );
  }

  double _calculateCellSize(BuildContext context, GameLevel level)
  {
    const double minSize = 30;
    // get screen size and calculate cell size based on that and the level size, with some padding
    var screenSize = MediaQuery.sizeOf(context);
    var safeAreaPadding = MediaQuery.of(context).viewPadding;
    var width = screenSize.width - safeAreaPadding.left - safeAreaPadding.right;
    var height = screenSize.height - safeAreaPadding.top - safeAreaPadding.bottom;
    height = height - 300;
    int horizontalClueMaxCount = 0;
    int verticalClueMaxCount = 0;
    for(int i = 0; i < level.size.y; i++) {
      var clue = level.getClueForRow(i);
      if (clue.tileClues.length > horizontalClueMaxCount) {
        horizontalClueMaxCount = clue.tileClues.length;
      }
    }

    for(int i = 0; i < level.size.x; i++) {
      var clue = level.getClueForColumn(i);
      if (clue.tileClues.length > verticalClueMaxCount) {
        verticalClueMaxCount = clue.tileClues.length;
      }
    }

    // todo: magic number feeling but looks good
    double horizontalClueOffset = horizontalClueMaxCount * 30 + 13;
    double verticalClueOffset = verticalClueMaxCount * 30 + 13;

    width = width - horizontalClueOffset;
    height = height - verticalClueOffset;

    var cellWidth = width / level.size.x;
    var cellHeight = height / level.size.y;
    return max(min(cellHeight, cellWidth), minSize);
  }
}

// draw the puzzle grid with clues and revealed/unrevealed tiles
class PicrossGrid extends StatelessWidget {
  const PicrossGrid({
    super.key,
    required this.level,
    required this.levelState,
    required this.playerSessionState,
    required this.cellSize,
  });

  final GameLevel level;
  final LevelState levelState;
  final PlaySessionScreenState playerSessionState;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 2,
              children: [
                for (int i = 0; i < level.size.x; i++)
                  VerticalClueWidget(clueData: level.getClueForColumn(i), cellSize: cellSize),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 2,
                children: [
                  for (int i = 0; i < level.size.y; i++)
                    HorizontalClueWidget(clueData: level.getClueForRow(i), cellSize: cellSize,),
                ],
              ),
              GameGestureManager(
                gridSize: level.size,
                cellSize: cellSize + 2,
                onTapReceived: _onTap,
                onDragReceived: _onDragReceived,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (int i = 0; i < level.size.y; i++)
                      PicrossRow(level: level, levelState: levelState, row: i, playerSessionState: playerSessionState, cellSize: cellSize),
                  ]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // gesture management
  void _onTap(int index) {
    if (!levelState.revealedTiles.contains(index)) {
      switch(playerSessionState.getInputMode()) 
      {
        case PlayerSessionInputMode.reveal:
          levelState.revealTile(index);

        case PlayerSessionInputMode.mark:
          levelState.toggleMarking(index);
      }
    }
  }

  void _onDragReceived(int index) {
    // ignore if marked and in mark mode (only in drag mode)
    if (levelState.isTileMarked(index) && playerSessionState.getInputMode() == PlayerSessionInputMode.mark) {
      return;
    }
    _onTap(index);
  }
}

class PicrossRow extends StatelessWidget {
  const PicrossRow({
    super.key,
    required this.level,
    required this.levelState,
    required this.row,
    required this.playerSessionState,
    required this.cellSize,
  });

  final GameLevel level;
  final LevelState levelState;
  final int row;
  final PlaySessionScreenState playerSessionState;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (int j = 0; j < level.size.x; j++)
              PicrossCell(level: level, levelState: levelState, row: row, column: j, playerSessionState: playerSessionState, cellSize: cellSize),
            //HorizontalBombCountClueEntry(clueData: clueData, cellSize: cellSize)
          ],
        ),
      ],
    );
  }
}

class HorizontalClueWidget extends StatelessWidget {
  const HorizontalClueWidget({
    super.key,
    required this.clueData,
    required this.cellSize,
  });

  final ClueData clueData;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onTertiary, fontSize: 18);

    return Container(
      color: theme.colorScheme.tertiary,
      child: SizedBox(
        height: cellSize,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 1,
                children: [
                  for (int i = 0; i < clueData.tileClues.length; i++)
                    HorizontalClueEntry(clue: clueData.tileClues[i], textTheme: textTheme, isLastClue: i == clueData.tileClues.length - 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalClueEntry extends StatelessWidget {
  const HorizontalClueEntry({
    super.key,
    required this.clue,
    required this.textTheme,
    required this.isLastClue,
  });

  final int clue;
  final TextStyle? textTheme;
  final bool isLastClue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(clue.toString(), textAlign: TextAlign.right, style: textTheme),
        if (!isLastClue)
          Icon(Icons.circle, size: 4, color: textTheme?.color),
      ],
    );
  }
}

class HorizontalBombCountClueEntry extends StatelessWidget {
  const HorizontalBombCountClueEntry({
    super.key,
    required this.clueData,
    required this.cellSize,
  });

  final ClueData clueData;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var warningTextTheme = theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onTertiary, fontSize: 12);

    return Container(
      color: theme.colorScheme.tertiary,
      child: SizedBox(
        height: cellSize,
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 1,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning, color: Colors.red, size: warningTextTheme?.fontSize ?? 12),
                      Text(clueData.bombCount.toString(), style: warningTextTheme,)
                    ],
                  )
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalClueWidget extends StatelessWidget {
  const VerticalClueWidget({
    super.key,
    required this.clueData,
    required this.cellSize,
  });

  final ClueData clueData;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onTertiary, fontSize: 18);
    //var warningTextTheme = theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onTertiary, fontSize: 12);

    return Container(
      color: theme.colorScheme.tertiary,
      child: SizedBox(
        width: cellSize,
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            //spacing: 3,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (var clue in clueData.tileClues)
                    Text(clue.toString(), textAlign: TextAlign.center, style: textTheme),
                ],
              ),
              /*Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.warning, size: warningTextTheme?.fontSize ?? 12, color: Colors.red,),
                  Text(clueData.bombCount.toString(), style: warningTextTheme)
                ],
              )*/
            ],
          ),
        ),
      )
    );
  }
}

class PicrossCell extends StatefulWidget {
  const PicrossCell({
    super.key,
    required this.level,
    required this.levelState,
    required this.row,
    required this.column,
    required this.playerSessionState,
    required this.cellSize, 
  });

  final GameLevel level;
  final LevelState levelState;
  final int row;
  final int column;
  final PlaySessionScreenState playerSessionState;
  final double cellSize;

  @override
  State<PicrossCell> createState() => _PicrossCellState();
}

class _PicrossCellState extends State<PicrossCell> {

  final Logger logger = Logger('PicrossCellState');
  bool didReceiveDrag = false;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return Container(
      color: Colors.grey,
      child: 
        Container(
          width: widget.cellSize,
          height: widget.cellSize,
          margin: const EdgeInsets.all(1),
          child: _drawTile(context, widget.level, widget.levelState, widget.cellSize),
        ),
    );

    /*return Stack(
      children: [
        DragTarget<int>(
          onWillAcceptWithDetails: (x) => _onDragReceived(x),
          builder: (context, x, y) => Container(
            color: Colors.grey,
            child: 
              Container(
                width: widget.cellSize,
                height: widget.cellSize,
                margin: const EdgeInsets.all(1),
                child: _drawTile(context, widget.level, widget.levelState, widget.cellSize),
              ),
          ),
        ),
        Draggable<int>(
          data: widget.row,
          dragAnchorStrategy: pointerDragAnchorStrategy,
          feedback: Container(width: 30, height: 30, color:Colors.grey),
          onDragStarted: () => _onTap(context),
          onDragUpdate: (x) => _onDragUpdate(context, x),
          child: Container(width: widget.cellSize, height: widget.cellSize, color: Colors.transparent),
        ),
      ]
    );*/
  }

  Widget _drawTile(BuildContext context, GameLevel level, LevelState levelState, double cellSize) {
    var theme = Theme.of(context);

    int index = widget.row * level.size.x + widget.column;

    // draw bombs
    if (levelState.revealedTiles.contains(index)) {
      // draw bomb state
      if (level.bombs.contains(index)) {
        return Container(
          width: cellSize,
          height: cellSize,
          color: Colors.red,
          child: const Icon(Icons.warning, color: Colors.white,),
        );
      }
    }

    // draw disabled tiles
    if (levelState.disabledTiles.contains(index)) {
      return Container(
          width: cellSize,
          height: cellSize,
          color: Colors.blueGrey,
          child: const Icon(Icons.done, color: Colors.white,),
        );
    }

    // draw revealed tile
    if (levelState.revealedTiles.contains(index)) {
      // draw revealed tile
      return Container(
        width: cellSize,
        height: cellSize,
        color: level.tiles[index] > 0 ? Colors.black : Colors.white
      );
    }
    else {
      if (levelState.isTileMarked(index)) {
        // draw marked state
        return Container(
          width: cellSize,
          height: cellSize,
          color: theme.colorScheme.secondary,
          child: Icon(Icons.flag),
        );
      }
      
      // draw hidden state
      return Container(
        width: cellSize,
        height: cellSize,
        color: theme.colorScheme.inversePrimary,
        child: Icon(Icons.help),);
    }
  }
}
