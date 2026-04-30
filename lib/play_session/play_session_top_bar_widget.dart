// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/style/my_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class PlaySessionTopBarWidget extends StatelessWidget {
  const PlaySessionTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleTheme = theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimary);

    return Container(
      color: theme.colorScheme.primary,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
              onPressed: () => GoRouter.of(context).go('/play'),
              child: const Text('Back'),
            ),
          ),
          Spacer(),
          Text('Play Picross!', 
            style: TextStyle(
              fontFamily: 'Permanent Marker',
              fontSize: 24,
              height: 1,
              color: titleTheme?.color
            ),
          ),
          Spacer(),
          InkResponse(
            onTap: () => GoRouter.of(context).push('/settings'),
            child: Image.asset(
              'assets/images/settings.png',
              semanticLabel: 'Settings',
            ),
          ),
        ],
      ),
    );
  }
}
