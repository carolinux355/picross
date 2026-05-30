// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/requirements/requirement_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final gameData = context.read<GameDataManager>();
    final tuningData = gameData.getTuning();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Select level',
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [
                  for (final worldId in tuningData.worldIds)
                    LevelSelectionWorldWidget(worldId: worldId),
                ],
              ),
            ),
          ],
        ),
        rectangularMenuArea: MyButton(
          onPressed: () {
            GoRouter.of(context).go('/');
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}

class LevelSelectionWorldWidget extends StatelessWidget {
  const LevelSelectionWorldWidget({
    super.key,
    required this.worldId,
  });

  final String worldId;

  @override
  Widget build(BuildContext context) {
    var gameDataManager = context.watch<GameDataManager>();
    var requirementManager = context.watch<RequirementManager>();
    var playerLivesManager = context.watch<PlayerLivesManager>();
    var worldConfig = gameDataManager.getData(worldId);
    bool isUnlocked = requirementManager.evaluateList(worldConfig!.components.feature.unlock);
    bool hasEnoughLives = playerLivesManager.getLives() >= worldConfig.components.world.requiredLives;

    return ListTile(
      enabled:
          true,
      onTap: () {
        if (isUnlocked && hasEnoughLives) {
          final audioController = context.read<AudioController>();
          audioController.playSfx(SfxType.buttonTap);
      
          GoRouter.of(
            context,
          ).go('/levelgeneration', extra: worldId);
        }
      },
      leading: isUnlocked ? Text('World') : Text('Locked'),
      title: Text(worldId),
    );
  }
}
