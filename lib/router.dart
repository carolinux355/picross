// Copyright 2023, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/crafting/crafting_screen.dart';
import 'package:basic/game_internals/level_state_controller.dart';
import 'package:basic/inventory/inventory_screen.dart';
import 'package:basic/loading/level_generation_loading_screen.dart';
import 'package:basic/loading/loading_screen.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/win_game/lost_game_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'level_selection/level_selection_screen.dart';
import 'main_menu/main_menu_screen.dart';
import 'play_session/play_session_screen.dart';
import 'settings/settings_screen.dart';
import 'style/my_transition.dart';
import 'style/palette.dart';
import 'win_game/win_game_screen.dart';

/// The router describes the game's navigational hierarchy, from the main
/// screen through settings screens all the way to each individual level.

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/loading',
  routes: [
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: '/loading',
      builder: (context, state) => const LoadingScreen(key: Key('loading')),
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: '/',
      builder: (context, state) => const MainMenuScreen(key: Key('main menu')),
      routes: [
        GoRoute(
          parentNavigatorKey: navigatorKey,
          path: 'play',
          pageBuilder: (context, state) { 
            var gameStateManager = context.read<GameStateManager>();
            if (gameStateManager.gameState.hasPersistedLevelState() && !gameStateManager.gameState.persistedLevelState.isComplete) {
              // go directly to the persisted level
              return buildMyTransition<void>(
                key: const ValueKey('persisted_level'),
                color: context.watch<Palette>().backgroundPlaySession,
                child: const PlaySessionScreen(),
              );
            }
            // else go to level select
            return buildMyTransition<void>(
              key: const ValueKey('play'),
              color: context.watch<Palette>().backgroundLevelSelection,
              child: const LevelSelectionScreen(key: Key('level selection')),
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: navigatorKey,
              path: 'session/:level',
              pageBuilder: (context, state) {                
                return buildMyTransition<void>(
                  key: const ValueKey('level'),
                  color: context.watch<Palette>().backgroundPlaySession,
                  child: PlaySessionScreen(),
                );
              },
            ),
            GoRoute(
              parentNavigatorKey: navigatorKey,
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
              parentNavigatorKey: navigatorKey,
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
          parentNavigatorKey: navigatorKey,
          path: 'settings',
          builder: (context, state) =>
              const SettingsScreen(key: Key('settings')),
        ),
        GoRoute(
          parentNavigatorKey: navigatorKey,
          path: 'inventory',
          builder: (context, state) =>
              const InventoryScreen(key: Key('inventory')),
        ),
        GoRoute(
          parentNavigatorKey: navigatorKey,
          path: 'levelgeneration',
          builder: (context, state) {
            final worldId = state.extra! as String;
            return LevelGenerationLoadingScreen(key: Key('levelgeneration'), worldId: worldId);
          }
        ),
        GoRoute(
          parentNavigatorKey: navigatorKey,
          path: 'crafting',
          builder: (context, state) =>
              const CraftingScreen(key: Key('crafting')),
        )
      ],
    ),
  ],
);
