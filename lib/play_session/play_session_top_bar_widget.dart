// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/shared_widgets/player_lives_widget.dart';
import 'package:basic/shared_widgets/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class PlaySessionTopBarWidget extends StatelessWidget {
  const PlaySessionTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              WalletWidget(showPlayerLives: false),
            ],
          ),
          Row(
            children: [
              InkResponse(
                onTap: () => GoRouter.of(context).push('/settings'),
                child: Image.asset(
                  'assets/icons/ui/settings.png',
                  semanticLabel: 'Settings',
                ),
              ),
              PlaySessionBackButtonWidget(),
              Spacer(),
              PlayerLivesWidget(),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}

class PlaySessionBackButtonWidget extends StatelessWidget {
  const PlaySessionBackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ElevatedButton(
        onPressed: () => _onTap(context),
        child: const Text('Quit'),
      ),
    );
  }

  void _onTap(BuildContext context) {
    final gameStateManager = context.read<GameStateManager>();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit Game'),
          content: const Text('Are you sure you want to exit the game? Your progress will be lost.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                gameStateManager.gameState.persistedLevelState.isComplete = true;
                GoRouter.of(context).go('/');
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
  }
}
