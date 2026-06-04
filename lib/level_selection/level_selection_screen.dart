// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/generated/configuration/Requirement.pb.dart';
import 'package:basic/level_selection/world_info_dialog.dart';
import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/requirements/requirement_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
              padding: EdgeInsets.all(16.0),
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
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < tuningData.worldIds.length; i++)
                     LevelSelectionWorldWidget(worldId: tuningData.worldIds[i], isEven: i % 2 == 0),
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
    required this.isEven
  });

  final String worldId;
  final bool isEven;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        children: [
          if (!isEven)
            Spacer(),
          LevelSelectWorldView(worldId: worldId),
          if (isEven)
            Spacer(),
        ]
      ),
    );
    /*return ListTile(
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
    );*/
  }
}

class LevelSelectWorldView extends StatelessWidget {
  const LevelSelectWorldView({
    super.key,
    required this.worldId,
  });

  final String worldId;

  @override
  Widget build(BuildContext context) {
    final gameDataManager = context.watch<GameDataManager>();
    final playerLivesManager = context.watch<PlayerLivesManager>();
    final requirementManager = context.watch<RequirementManager>();
    final worldConfig = gameDataManager.getData(worldId);
    final image = AssetImage(worldConfig!.components.asset.sprite);

    bool isUnlocked = requirementManager.evaluateList(worldConfig.components.feature.unlock);
    bool hasEnoughLives = playerLivesManager.getLives() >= worldConfig.components.world.requiredLives;
    
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Opacity(
        opacity: hasEnoughLives ? 1.0 : 0.5,
        child: Column(
          children: [
            Image(image: image, color: isUnlocked ? Colors.white : Colors.grey, colorBlendMode: BlendMode.modulate,),
            Text(worldConfig.components.localizedName.name)
          ]
        )
      ),
    );
  }

  void _onTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => WorldInfoDialog(
        worldId: worldId,
      )
    );
  }
}