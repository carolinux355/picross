import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/style/reward_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelUpDialog extends SimpleDialog {
  const LevelUpDialog({super.key, required this.levelUpRewards}) : super();

  final List<Grant> levelUpRewards;

  @override
  Widget build(BuildContext context) {
    final gameStateManager = context.read<GameStateManager>();

    return SimpleDialog(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  const Text(
                    'Level Up!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Permanent Marker'
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Reached Level ${gameStateManager.gameState.playerLevel}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]
              ),
            ),
            // Rewards row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var reward in levelUpRewards)
                    RewardView(reward: reward)
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Collect button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Collect'),
                ),
              ),
            ),
          ],
        ),
      ]
    );
  }
}
