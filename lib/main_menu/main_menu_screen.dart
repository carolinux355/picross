// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/main.dart';
import 'package:basic/main_menu/main_scene.dart';
import 'package:basic/shared_widgets/player_lives_widget.dart';
import 'package:basic/shared_widgets/xp_widget.dart';
import 'package:basic/style/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/my_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: KeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        onKeyEvent: (event) {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.keyD) {
            MyApp.openDebugMenu(context);
          }
        },
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset('assets/images/background_harbor.png',
                fit: BoxFit.fill,
              ),
            ),
            ResponsiveScreen(
              rectangularMenuArea: Container(),
              squarishMainArea: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ 
                  Expanded(
                    child: Stack(
                      children: [
                        MainMenuScreenCenterContainer(),
                        MainMenuScreenTopHUD(),
                      ],
                    ),
                  ),
                  MainMenuScreenBottomHUD(),
                ]
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class MainMenuScreenTopHUD extends StatelessWidget {
  const MainMenuScreenTopHUD({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children:[
        XPWidget(),
        PlayerLivesWidget()
      ]
    );
  }
}

class MainMenuScreenBottomHUD extends StatelessWidget {
  const MainMenuScreenBottomHUD({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = context.watch<AudioController>();
    final backgroundImage = Image.asset('assets/icons/buttonLong_beige_pressed.png');

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: backgroundImage.image,
          fit: BoxFit.fill
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children:[ 
            Spacer(),
            MainMenuBottomHUDButton(label: 'Quests'),
            Spacer(),
            MainMenuBottomHUDButton(label: 'Upgrades'),
            Spacer(),
            MainMenuBottomHUDButton(label: 'Town'),
            Spacer(),
            MyButton(
              onPressed: () {
                audioController.playSfx(SfxType.buttonTap);
                GoRouter.of(context).go('/play');
              },
              child: const Text('Play'),
            ),
          ]
        ),
      ),
    );
  }
}

class MainMenuBottomHUDButton extends StatelessWidget {
  const MainMenuBottomHUDButton({
    super.key,
    required this.label
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Container(
        color: Colors.brown,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label, 
            textAlign: TextAlign.center, 
            style: TextStyle(
              fontFamily: 'Permanent Marker', 
              fontSize: 14, 
              color: Colors.white
              ),
            ),
        )
      )
    );
  }
}

class MainMenuScreenCenterContainer extends StatelessWidget {
  const MainMenuScreenCenterContainer({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Stack(
        children:[ 
          MainSceneWidget(),
          Positioned(
            right: 10,
            child: MainMenuScreenRightHUD(),
          )
        ]
      ),
    );
  }
}

class MainMenuScreenRightHUD extends StatelessWidget {
  const MainMenuScreenRightHUD({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      children:[ 
        MyButton(
          onPressed: () => GoRouter.of(context).push('/inventory'),
          child: const Text('Inventory'),
        ),
        _gap,
        MyButton(
          onPressed: () => GoRouter.of(context).push('/settings'),
          child: const Text('Settings'),
        ),
      ]
    );
  }

  static const _gap = SizedBox(height: 10);
}