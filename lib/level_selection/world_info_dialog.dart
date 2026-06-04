import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/requirements/requirement_manager.dart';
import 'package:basic/style/my_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WorldInfoDialog extends SimpleDialog {

  final String worldId;

  const WorldInfoDialog({super.key, required this.worldId}) : super();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        _buildDialog(context)
      ]
    );
  }

  Widget _buildDialog(BuildContext context) {
    final gameDataManager = context.watch<GameDataManager>();
    final playerLivesManager = context.watch<PlayerLivesManager>();
    final requirementManager = context.watch<RequirementManager>();
    final worldConfig = gameDataManager.getData(worldId);

    bool hasEnoughLives = playerLivesManager.getLives() >= worldConfig!.components.world.requiredLives;
    bool isUnlocked = requirementManager.evaluateList(worldConfig.components.feature.unlock);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            children: [
              Image.asset(worldConfig.components.asset.sprite),
              Text(worldConfig.components.localizedName.description, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text('Possible resources:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  for (var resource in worldConfig.components.world.possibleResources)
                    WorldInfoDialogPossibleResourceWidget(gameDataManager: gameDataManager, resource: resource),
                ],
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isUnlocked)
                    MyButton(
                      onPressed: () {
                        _startLevel(context);
                      },
                      child: hasEnoughLives? Text('Start level') : Text('Need ${worldConfig.components.world.requiredLives} lives'),
                    )
                  else
                    Text('Locked')
                ],
              )
            ]
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close),
          ),
        )
      ]
    );
  }

  void _startLevel(BuildContext context) {
    final gameDataManager = context.read<GameDataManager>();
    final requirementManager = context.read<RequirementManager>();
    final worldConfig = gameDataManager.getData(worldId);
    
    bool isUnlocked = requirementManager.evaluateList(worldConfig!.components.feature.unlock);

    if (isUnlocked) {
      GoRouter.of(context).go('/levelgeneration', extra: worldId);
    }
  }
}

class WorldInfoDialogPossibleResourceWidget extends StatelessWidget {
  const WorldInfoDialogPossibleResourceWidget({
    super.key,
    required this.gameDataManager,
    required this.resource,
  });

  final GameDataManager gameDataManager;
  final String resource;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(gameDataManager.getData(resource)!.components.asset.sprite, width: 40, height: 40,)
    );
  }
}
