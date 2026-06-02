// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/game_internals/level_state_controller.dart';
import 'package:basic/shared_widgets/xp_widget.dart';
import 'package:basic/style/reward_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class WinGameScreen extends StatelessWidget {
  final LevelCompleteState levelCompleteState;

  const WinGameScreen({super.key, required this.levelCompleteState});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'Voyage Complete!',
                style: TextStyle(fontFamily: 'Permanent Marker', fontSize: 42),
              ),
            ),
            SizedBox(height: 50),
            XPWidget(),
            SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  Text(
                    'Rewards:',
                    style: const TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      scrollDirection: Axis.vertical,
                      children: [
                        for (var reward in levelCompleteState.rewards)
                          RewardView(reward: reward)
                      ]
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        rectangularMenuArea: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            MyButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: const Text('Town'),
            ),
            MyButton(
              onPressed: () {
                GoRouter.of(context).go('/play');
              },
              child: const Text('World Select'),
            ),
            MyButton(
              onPressed: () {
                GoRouter.of(context).go('/levelgeneration', extra: levelCompleteState.worldId);
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
