
import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/level_generator.dart';
import 'package:basic/loot_tables/loot_table_manager.dart';
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
    var lootTableManager = context.watch<LootTableManager>();
    var levelGenerator = context.watch<LevelGenerator>();
    
    var generatedLevel = levelGenerator.generateLevel(gameDataManager: gameData, lootTableManager: lootTableManager, worldId: widget.worldId);

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