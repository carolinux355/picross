// Copyright 2023, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/game_internals/level_state.dart';
import 'package:basic/inventory/inventory_screen.dart';
import 'package:basic/loading/loading_screen.dart';
import 'package:basic/win_game/lost_game_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'level_selection/level_selection_screen.dart';
import 'level_selection/levels.dart';
import 'main_menu/main_menu_screen.dart';
import 'play_session/play_session_screen.dart';
import 'settings/settings_screen.dart';
import 'style/my_transition.dart';
import 'style/palette.dart';
import 'win_game/win_game_screen.dart';

/// The router describes the game's navigational hierarchy, from the main
/// screen through settings screens all the way to each individual level.
final router = GoRouter(
  initialLocation: '/loading',
  routes: [
    GoRoute(
      path: '/loading',
      builder: (context, state) => const LoadingScreen(key: Key('loading')),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const MainMenuScreen(key: Key('main menu')),
      routes: [
        GoRoute(
          path: 'play',
          pageBuilder: (context, state) => buildMyTransition<void>(
            key: const ValueKey('play'),
            color: context.watch<Palette>().backgroundLevelSelection,
            child: const LevelSelectionScreen(key: Key('level selection')),
          ),
          routes: [
            GoRoute(
              path: 'session/:level',
              pageBuilder: (context, state) {
                GameLevel level = state.extra! as GameLevel;
                
                return buildMyTransition<void>(
                  key: const ValueKey('level'),
                  color: context.watch<Palette>().backgroundPlaySession,
                  child: PlaySessionScreen(
                    level,
                    key: const Key('play session'),
                  ),
                );
              },
            ),
            GoRoute(
              path: 'won',
              redirect: (context, state) {
                if (state.extra == null) {
                  // Trying to navigate to a win screen without any data.
                  // Possibly by using the browser's back button.
                  return '/';
                }

                // Otherwise, do not redirect.
                return null;
              },
              pageBuilder: (context, state) {
                final levelCompleteState = state.extra! as LevelCompleteState;

                return buildMyTransition<void>(
                  key: const ValueKey('won'),
                  color: context.watch<Palette>().backgroundPlaySession,
                  child: WinGameScreen(
                    levelCompleteState: levelCompleteState,
                    key: const Key('win game'),
                  ),
                );
              },
            ),
            GoRoute(
              path: 'lost',
              redirect: (context, state) {
                // Otherwise, do not redirect.
                return null;
              },
              pageBuilder: (context, state) {
                return buildMyTransition<void>(
                  key: const ValueKey('lost'),
                  color: context.watch<Palette>().backgroundPlaySession,
                  child: LostGameScreen(
                    key: const Key('lost game'),
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) =>
              const SettingsScreen(key: Key('settings')),
        ),
        GoRoute(
          path: 'inventory',
          builder: (context, state) =>
              const InventoryScreen(key: Key('inventory')),
        ),
      ],
    ),
  ],
);
