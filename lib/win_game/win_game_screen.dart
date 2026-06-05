
import 'package:basic/game_internals/level_state_controller.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/shared_widgets/xp_widget.dart';
import 'package:basic/style/reward_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class WinGameScreen extends StatefulWidget {

  final LevelCompleteState levelCompleteState;
  const WinGameScreen({super.key, required this.levelCompleteState});

  @override
  State<WinGameScreen> createState() => _WinGameScreenState();
}

class _WinGameScreenState extends State<WinGameScreen> with SingleTickerProviderStateMixin {

  final int kInitialDelayMs = 700;
  final int kRewardViewScaleDelay = 1300;
  final int kButtonFadeInDelay = 1700;

  @override 
  void initState() {
    super.initState();
    _playSequence(context);
  }

  Future _playSequence(BuildContext context) async {
    var grantManager = context.read<GrantManager>();
    await Future.delayed(Duration(milliseconds: kInitialDelayMs));
    grantManager.flushPendingGrants();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final grantManager = context.watch<GrantManager>();

    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Voyage Complete!',
                style: TextStyle(fontFamily: 'Permanent Marker', fontSize: 42),
              ).animate(delay: Duration(milliseconds: 300))
              .scale(duration: Duration(milliseconds: 300), curve: Curves.easeOutBack),
            ),
            SizedBox(height: 50),
            XPWidget(),
            SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  Text(
                    'Rewards:',
                    style: const TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      scrollDirection: Axis.vertical,
                      itemCount: widget.levelCompleteState.rewards.length,
                      itemBuilder: (context, index) => RewardView(reward: widget.levelCompleteState.rewards[index])
                      .animate()
                       .scale(
                        delay: Duration(milliseconds: kRewardViewScaleDelay + (index * 100)),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOutBack
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        rectangularMenuArea: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            MyButton(
              onPressed: () {
                grantManager.flushPendingGrants();
                GoRouter.of(context).go('/');
              },
              child: const Text('Town'),
            ),
            MyButton(
              onPressed: () {
                grantManager.flushPendingGrants();
                GoRouter.of(context).go('/play');
              },
              child: const Text('World Select'),
            ),
            MyButton(
              onPressed: () {
                grantManager.flushPendingGrants();
                GoRouter.of(context).go('/levelgeneration', extra: widget.levelCompleteState.worldId);
              },
              child: const Text('Next'),
            ),
          ],
        ).animate()
        .fadeIn(delay: Duration(milliseconds: kButtonFadeInDelay))
        .moveY(duration: Duration(milliseconds: 300), begin: 3.0, end: 0.0),
      ),
    );
  }
}
