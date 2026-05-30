// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math';

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/generated/persistence/PersistedLevelState.pb.dart';
import 'package:basic/math/constant_vector.dart';
import 'package:basic/play_session/game_gesture_manager.dart';
import 'package:basic/play_session/play_session_screen.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

//import '../audio/audio_controller.dart';
//import '../audio/sounds.dart';
import '../game_internals/level_state_controller.dart';
import '../level_selection/clue_provider.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class GameWidget extends StatelessWidget {
  const GameWidget({super.key, required this.playerSessionState, required this.levelState});

  final PlaySessionScreenState playerSessionState;
  final PersistedLevelState levelState;

  @override
  Widget build(BuildContext context) {
    final clueProvider = ClueProvider(levelState: levelState);
    final levelStateController = context.watch<LevelStateController>();

    double cellSize = _calculateCellSize(context, clueProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        PicrossGrid(clueProvider: clueProvider, levelState: levelState, levelStateController: levelStateController, playerSessionState: playerSessionState, cellSize: cellSize,),
        Spacer()
      ],
    );
  }

  double _calculateCellSize(BuildContext context, ClueProvider clueProvider)
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
    for(int i = 0; i < levelState.size.y; i++) {
      var clue = clueProvider.getClueForRow(i);
      if (clue.tileClues.length > horizontalClueMaxCount) {
        horizontalClueMaxCount = clue.tileClues.length;
      }
    }

    for(int i = 0; i < levelState.size.x; i++) {
      var clue = clueProvider.getClueForColumn(i);
      if (clue.tileClues.length > verticalClueMaxCount) {
        verticalClueMaxCount = clue.tileClues.length;
      }
    }

    // todo: magic number feeling but looks good
    double horizontalClueOffset = horizontalClueMaxCount * 30 + 13;
    double verticalClueOffset = verticalClueMaxCount * 30 + 13;

    width = width - horizontalClueOffset;
    height = height - verticalClueOffset;

    var cellWidth = width / levelState.size.x;
    var cellHeight = height / levelState.size.y;
    return max(min(cellHeight, cellWidth), minSize);
  }
}

// draw the puzzle grid with clues and revealed/unrevealed tiles
class PicrossGrid extends StatelessWidget {
  const PicrossGrid({
    super.key,
    required this.clueProvider,
    required this.levelState,
    required this.levelStateController,
    required this.playerSessionState,
    required this.cellSize,
  });

  final ClueProvider clueProvider;
  final PersistedLevelState levelState;
  final LevelStateController levelStateController;
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
                for (int i = 0; i < levelState.size.x; i++)
                  VerticalClueWidget(clueData: clueProvider.getClueForColumn(i), cellSize: cellSize),
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
                  for (int i = 0; i < levelState.size.y; i++)
                    HorizontalClueWidget(clueData: clueProvider.getClueForRow(i), cellSize: cellSize,),
                ],
              ),
              GameGestureManager(
                gridSize: ConstantVector2.fromProto(levelState.size),
                cellSize: cellSize + 2,
                onTapReceived: _onTap,
                onDragReceived: _onDragReceived,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (int i = 0; i < levelState.size.y; i++)
                      PicrossRow(clueProvider: clueProvider, levelStateController: levelStateController, row: i, playerSessionState: playerSessionState, cellSize: cellSize),
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
          levelStateController.revealTile(index);

        case PlayerSessionInputMode.mark:
          levelStateController.toggleMarking(index);
      }
    }
  }

  void _onDragReceived(int index) {
    // ignore if marked and in mark mode (only in drag mode)
    if (levelStateController.isTileMarked(index) && playerSessionState.getInputMode() == PlayerSessionInputMode.mark) {
      return;
    }
    _onTap(index);
  }
}

class PicrossRow extends StatelessWidget {
  const PicrossRow({
    super.key,
    required this.clueProvider,
    required this.levelStateController,
    required this.row,
    required this.playerSessionState,
    required this.cellSize,
  });

  final ClueProvider clueProvider;
  final LevelStateController levelStateController;
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
            for (int j = 0; j < levelStateController.size().x; j++)
              PicrossCell(clueProvider: clueProvider, levelStateController: levelStateController, row: row, column: j, playerSessionState: playerSessionState, cellSize: cellSize),
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
    required this.clueProvider,
    required this.levelStateController,
    required this.row,
    required this.column,
    required this.playerSessionState,
    required this.cellSize, 
  });

  final ClueProvider clueProvider;
  final LevelStateController levelStateController;
  final int row;
  final int column;
  final PlaySessionScreenState playerSessionState;
  final double cellSize;

  @override
  State<PicrossCell> createState() => _PicrossCellState();
}

class _PicrossCellState extends State<PicrossCell> with SingleTickerProviderStateMixin {

  final Logger logger = Logger('PicrossCellState');
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _didReveal = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutSine));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.row * widget.levelStateController.size().x + widget.column;
    if (!_didReveal && widget.levelStateController.state.revealedTiles.contains(index)) {
      _didReveal = true;
      _animationController.forward();
    }

    return Container(
      color: Colors.grey,
      child: 
        Container(
          width: widget.cellSize,
          height: widget.cellSize,
          margin: const EdgeInsets.all(1),
          child: AnimatedBuilder(
            animation: _animation, 
            builder: (context, child) {
              return Transform(
                transform: Matrix4.rotationY(_animation.value * pi),
                alignment: Alignment.center,
                child: _animation.value < 0.5 ? _drawHiddenState(context, widget.levelStateController, widget.cellSize) :
                  _drawRevealedState(context, widget.clueProvider, widget.levelStateController, widget.cellSize)
              );
            }
          ),
        ),
    );
  }

  Widget _drawHiddenState(BuildContext context, LevelStateController levelState, double cellSize) {
    var theme = Theme.of(context);
    int index = widget.row * levelState.size().x + widget.column;

    // draw disabled tiles
    if (levelState.disabledTiles.contains(index)) {
      return Container(
        width: cellSize,
        height: cellSize,
        color: Colors.blueGrey,
        child: const Icon(Icons.done, color: Colors.white,),
      );
    }

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

  Widget _drawRevealedState(BuildContext context, ClueProvider clueProvider, LevelStateController levelState, double cellSize) {
    int index = widget.row * levelState.size().x + widget.column;

    // draw bombs
    if (levelState.state.revealedTiles.contains(index)) {
      // draw bomb state
      if (levelState.bombs.contains(index)) {
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

    var grant = levelState.getRewardPreviewAtIndex(index);
    // draw revealed tile
    if (levelState.state.revealedTiles.contains(index)) {
      // draw revealed tile
      return Container(
        width: cellSize,
        height: cellSize,
        color: levelState.state.tiles[index] > 0 ? const Color.fromARGB(255, 0, 21, 137) : Colors.white,
        child: grant != null ? PicrossCellRewardPreview(grant: grant, cellSize: cellSize,) : null
      );
    }

    return _drawHiddenState(context, levelState, cellSize);
  }
}

class PicrossCellRewardPreview extends StatefulWidget {
  const PicrossCellRewardPreview({
    super.key,
    required this.grant,
    required this.cellSize
  });

  final double cellSize;
  final Grant grant;

  @override
  State<PicrossCellRewardPreview> createState() => _PicrossCellRewardPreviewState();
}

class _PicrossCellRewardPreviewState extends State<PicrossCellRewardPreview> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this
    );
    _animation = Tween<double>(begin: 1, end: 0.3).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final gameData = context.read<GameDataManager>();
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, listenable) { 
        return Padding(
          padding: EdgeInsetsGeometry.all(widget.cellSize * _animation.value),
          child: Image.asset(gameData.getData(widget.grant.id)!.components.asset.sprite)
        );
      }
    );
  }
}
