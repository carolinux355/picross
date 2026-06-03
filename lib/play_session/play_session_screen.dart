// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/play_session/play_session_bottom_bar_widget.dart';
import 'package:basic/play_session/play_session_top_bar_widget.dart';
import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart' hide Level;
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state_controller.dart';
import '../style/confetti.dart';
import 'game_widget.dart';

/// This widget defines the entirety of the screen that the player sees when
/// they are playing a level.
///
/// It is a stateful widget because it manages some state of its own,
/// such as whether the game is in a "celebration" state.
class PlaySessionScreen extends StatefulWidget {

  const PlaySessionScreen({super.key});

  @override
  State<PlaySessionScreen> createState() => PlaySessionScreenState();
}

enum PlayerSessionState { playing, celebrating, lostState, }
enum PlayerSessionInputMode { reveal, mark }

class PlaySessionScreenState extends State<PlaySessionScreen> {
  static final _log = Logger('PlaySessionScreen');

  static const _celebrationDuration = Duration(milliseconds: 2000);

  static const _preCelebrationDuration = Duration(milliseconds: 500);

  static PlayerSessionState _playerSessionState = PlayerSessionState.playing;
  static PlayerSessionInputMode _playerSessionInputMode = PlayerSessionInputMode.reveal;

  @override
  void initState() {
    super.initState();

    _playerSessionState = PlayerSessionState.playing;
  }

  @override
  Widget build(BuildContext context) {
    final settingsController = context.watch<SettingsController>();
    final grantManager = context.watch<GrantManager>();
    final gameStateManager = context.watch<GameStateManager>();
    final gameDataManager = context.watch<GameDataManager>();
    final playerLivesManager = context.watch<PlayerLivesManager>();

    final levelState = gameStateManager.gameState.persistedLevelState;

    return MultiProvider(
      providers: [
        // Create and provide the [LevelState] object that will be used
        // by widgets below this one in the widget tree.
        ChangeNotifierProvider(
          create: (context) =>
              LevelStateController(
                onWin: _playerWon, 
                onLose: _playerLost, 
                playerLivesManager: playerLivesManager, 
                settingsController: settingsController, 
                grantManager: grantManager,
                gameStateManager: gameStateManager,
                gameDataManager: gameDataManager
              ),
        ),
      ],
      child: IgnorePointer(
        // Ignore all input during the celebration animation.
        ignoring: _playerSessionState != PlayerSessionState.playing,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/water_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PlaySessionTopBarWidget(),
                      //const Spacer(),
                      Expanded(child: GameWidget(playerSessionState: this, levelState: levelState,)),
                      //const Spacer(),
                      PlaySessionBottomBarWidget(playerSessionState: this,),
                    ],
                  ),
                  // This is the confetti animation that is overlaid on top of the
                  // game when the player wins.
                  SizedBox.expand(
                    child: Visibility(
                      visible: _playerSessionState == PlayerSessionState.celebrating,
                      child: IgnorePointer(
                        child: Confetti(isStopped: _playerSessionState != PlayerSessionState.celebrating),
                      ),
                    ),
                  ),
                  // This is the dark scrim overlay animation that is overlaid on top of the
                  // game when the player loses.
                  SizedBox.expand(
                    child: Visibility(
                      visible: _playerSessionState == PlayerSessionState.lostState,
                      child: IgnorePointer(
                        child: Container(color: Colors.black.withAlpha(128)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _playerWon(LevelCompleteState levelCompleteState) async {
    _log.info('Level won');
    
    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    setState(() {
      _playerSessionState = PlayerSessionState.celebrating;
    });

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.congrats);

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    GoRouter.of(context).go('/play/won', extra: levelCompleteState);
  }

  Future<void> _playerLost() async {
    _log.info('Level lost');

    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    setState(() {
      _playerSessionState = PlayerSessionState.lostState;
    });

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.huhsh);

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    GoRouter.of(context).go('/play/lost');
  }

  void setInputMode(PlayerSessionInputMode mode) {
    setState(() {
      _playerSessionInputMode = mode;
    });
  }

  PlayerSessionInputMode getInputMode() {
    return _playerSessionInputMode;
  }
}
