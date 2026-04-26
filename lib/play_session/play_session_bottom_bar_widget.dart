// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

//import 'package:basic/style/my_button.dart';
import 'package:basic/game_internals/level_state.dart';
import 'package:basic/play_session/play_session_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:go_router/go_router.dart';
//import 'package:provider/provider.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class PlaySessionBottomBarWidget extends StatelessWidget {
  const PlaySessionBottomBarWidget({super.key, required this.playerSessionState});

  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final levelState = context.watch<LevelState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 100,
            color: theme.colorScheme.surfaceContainer,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  PlayerLivesCounterWidget(levelState: levelState,),
                  Spacer(),
                  PlaySessionBottomBarInputWidget(playerSessionState: playerSessionState),
                ],
              ),
            ),
          ),
        )
      ]
    );
  }
}

class PlayerLivesCounterWidget extends StatelessWidget {
  const PlayerLivesCounterWidget({
    super.key,
    required this.levelState
  });

  final LevelState levelState;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        for(int i = 0; i < levelState.playerLives; i++)
          Icon(
            Icons.circle, 
            color: levelState.getLivesRemaining() > i ? Colors.blue : Colors.red,)
      ],
    );
  }
}

class PlaySessionBottomBarInputWidget extends StatelessWidget {
  const PlaySessionBottomBarInputWidget({super.key, required this.playerSessionState});

  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.primary,
      padding: EdgeInsets.all(20),
    );
    final unselectedStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.grey,
      padding: EdgeInsets.all(20),
    );

    final inputMode = playerSessionState.getInputMode();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            SizedBox(
              width: 50,
              height: 40,
              child: ElevatedButton(
                style: inputMode == PlayerSessionInputMode.reveal ? selectedStyle : unselectedStyle,
                onPressed: () {
                  playerSessionState.setInputMode(PlayerSessionInputMode.reveal);
                },
                child: Icon(
                  Icons.square, 
                  color: inputMode == PlayerSessionInputMode.reveal ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                )
              )
            ),
            SizedBox(
              width: 50,
              height: 40, 
              child: ElevatedButton(
                style: inputMode == PlayerSessionInputMode.mark ? selectedStyle : unselectedStyle,
                onPressed: () {
                  playerSessionState.setInputMode(PlayerSessionInputMode.mark);
                },
                child: Icon(
                  Icons.close,
                  color: inputMode == PlayerSessionInputMode.mark ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                )
              )
            )
          ],
        ),
      ]
    );
  }
}