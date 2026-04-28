// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/persistence/game_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../settings/settings.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();
    final gameStateManager = context.watch<GameStateManager>();

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ 
          Spacer(),
          SizedBox(height: 50),
          Column(
            children: [
              Transform.rotate(
                angle: -0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Play Picross!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Permanent Marker',
                        fontSize: 55,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Text(
                'Player Level: ${gameStateManager.gameState.numLevelsPlayed}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 24,
                  height: 1,
                ),
              ),
              Text(
                'XP: ${gameStateManager.gameState.xp}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 24,
                  height: 1,
                ),
              ),
            ],
          ),
          Spacer(),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  onPressed: () {
                    audioController.playSfx(SfxType.buttonTap);
                    GoRouter.of(context).go('/play');
                  },
                  child: const Text('Play'),
                ),
                _gap,
                MyButton(
                  onPressed: () => GoRouter.of(context).push('/settings'),
                  child: const Text('Settings'),
                ),
                _gap,
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: settingsController.audioOn,
                    builder: (context, audioOn, child) {
                      return IconButton(
                        onPressed: settingsController.toggleAudioOn,
                        icon: Icon(audioOn ? Icons.volume_up : Icons.volume_off),
                      );
                    },
                  ),
                ),
                _gap,
                const Text('Music by Mr Smith'),
                _gap,
              ],
            ),
          ),
        ]
      ),
    );
  }

  static const _gap = SizedBox(height: 10);
}
