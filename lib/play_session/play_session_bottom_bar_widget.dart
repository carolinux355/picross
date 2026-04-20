// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/style/my_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class PlaySessionBottomBarWidget extends StatelessWidget {
  const PlaySessionBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      widthFactor: double.infinity,
      child: Container(
        height: 50,
        color: theme.colorScheme.secondary,
      )
    );
  }
}
