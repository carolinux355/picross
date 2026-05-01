// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/game_internals/level_state.dart';
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

    const gap = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            gap,
            const Center(
              child: Text(
                'You won!',
                style: TextStyle(fontFamily: 'Permanent Marker', fontSize: 50),
              ),
            ),
            gap,
            Center(
              child: Column(
                children: [
                  Text(
                    'Score: ${levelCompleteState.score.score}\n'
                    'Time: ${levelCompleteState.score.formattedTime}',
                    style: const TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Rewards:',
                    style: const TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
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
        rectangularMenuArea: MyButton(
          onPressed: () {
            GoRouter.of(context).go('/play');
          },
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
