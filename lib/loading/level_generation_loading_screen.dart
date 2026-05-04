import 'dart:math';

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/level_generator.dart';
import 'package:basic/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// draw loading screen that waits on level generation to complete
class LevelGenerationLoadingScreen extends StatefulWidget {
  final String worldId;

  const LevelGenerationLoadingScreen({super.key, required this.worldId});

  @override
  State<LevelGenerationLoadingScreen> createState() => _LevelGenerationLoadingScreen();
}

class _LevelGenerationLoadingScreen extends State<LevelGenerationLoadingScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var palette = context.watch<Palette>();
    var gameData = context.watch<GameDataManager>();
    var levelGenerator = context.watch<LevelGenerator>();
    final random = Random();

    var difficultyConfig = gameData.getData(widget.worldId)!.components.levelDifficulty;
    int sizeX = random.nextInt(difficultyConfig.sizeRange.max - difficultyConfig.sizeRange.min) + difficultyConfig.sizeRange.min;
    int sizeY = random.nextInt(difficultyConfig.sizeRange.max - difficultyConfig.sizeRange.min) + difficultyConfig.sizeRange.min;
    int difficulty = random.nextInt(difficultyConfig.difficultyRange.max - difficultyConfig.difficultyRange.min) + difficultyConfig.difficultyRange.min;
    var generatedLevel = levelGenerator.generateLevel(width: sizeX, height: sizeY, difficulty: difficulty, worldId: widget.worldId);

    var goRouter = GoRouter.of(context);
    generatedLevel.then((result) {
      goRouter.go('/play/session/generated', extra: result);
    });

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: Center(
        child: 
          const Text(
            'Loading...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Permanent Marker',
              fontSize: 55,
              height: 1,
            ),
          ),
      ),
    );
  }
}