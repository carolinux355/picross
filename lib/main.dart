// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:developer' as dev;

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/level_generator.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/loading/service_provider.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'app_lifecycle/app_lifecycle.dart';
import 'audio/audio_controller.dart';
import 'router.dart';
import 'settings/settings.dart';
import 'style/palette.dart';

void main() async {

  debugPaintSizeEnabled = false;

  // Basic logging setup.
  Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
    );
  });

  WidgetsFlutterBinding.ensureInitialized();
  // Put game into full screen mode on mobile devices.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // Lock the game to portrait mode on mobile devices.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: Builder(
        builder: (context) {
          return MultiProvider(
            providers: [
              Provider(create: (context) => Palette()),
              Provider(create: (context) => SettingsController()),
              Provider(create: (context) => LevelGenerator()),
              Provider(create: (context) => GameStateManager()),
              Provider(create: (context) => GameDataManager()),
              Provider(create: (context) => InventoryManager()),
              Provider(create: (context) => GrantManager()),
              Provider(create: (context) => ServiceProvider()),
              ProxyProvider2<AppLifecycleStateNotifier,SettingsController,AudioController>(
                create: (context) => AudioController(),
                update: (context, lifecycleNotifier, settings, audio) {
                  audio!.attachDependencies(lifecycleNotifier, settings);
                  return audio;
                },
                dispose: (context, audio) => audio.dispose(),
                // Ensures that music starts immediately.
                lazy: false,
              ),
            ],
            child: Builder(
              builder: (context) {
                final palette = context.watch<Palette>();
          
                return MaterialApp.router(
                  title: 'My Flutter Game',
                  theme:
                      ThemeData.from(
                        colorScheme: ColorScheme.fromSeed(
                          seedColor: palette.darkPen,
                          surface: palette.backgroundMain,
                        ),
                        textTheme: TextTheme(
                          bodyMedium: TextStyle(color: palette.ink),
                        ),
                        useMaterial3: true,
                      ).copyWith(
                        // Make buttons more fun.
                        filledButtonTheme: FilledButtonThemeData(
                          style: FilledButton.styleFrom(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                  routerConfig: router,
                );
              },
            ),
          );
        }
      ),
    );
  }
}
