// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

//import 'package:basic/style/my_button.dart';
import 'package:basic/play_session/play_session_powerups_widget.dart';
import 'package:basic/play_session/play_session_screen.dart';
import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
//import 'package:provider/provider.dart';

/// This widget defines the bottom HUD during a picross game
class PlaySessionBottomBarWidget extends StatelessWidget {
  const PlaySessionBottomBarWidget({super.key, required this.playerSessionState});

  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  PlaySessionPowerupsWidget(),
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
                  Icons.flag,
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