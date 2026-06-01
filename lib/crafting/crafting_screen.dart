import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/crafting/crafting_manager.dart';
import 'package:basic/generated/configuration/Components/CraftingRecipeComponent.pb.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/generated/configuration/Requirement.pb.dart';
import 'package:basic/generated/persistence/CraftingState.pb.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/shared_widgets/player_lives_widget.dart';
import 'package:basic/style/responsive_screen.dart';
import 'package:basic/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/my_button.dart';
import '../style/palette.dart';

class CraftingScreen extends StatelessWidget {
  const CraftingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final gameDataManager = context.watch<GameDataManager>();
    final craftingManager = context.watch<CraftingManager>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen (
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Crafting',
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            //const SizedBox(height: 50),
            Expanded(
              child: Column(
                children: [
                  for (var recipeId in craftingManager.getAllCraftingRecipes())
                    CraftingRecipeWidget(recipeId: recipeId, recipe: gameDataManager.getData(recipeId)!.components.craftingRecipe),
                ]
              ),
            ),
            CraftingQueueWidget(),
          ],
        ),
        rectangularMenuArea: MyButton(
          onPressed: () {
            GoRouter.of(context).go('/');
          },
          child: const Text('Back'),
        )
      ),
    );
  }
}

class CraftingQueueWidget extends StatelessWidget {
  const CraftingQueueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final gameStateManager = context.watch<GameStateManager>();

    return Column(
      children: [
        Text('Crafting Queue', style: TextStyle(fontFamily: 'Permanent Marker', fontSize: 18),),
        for (var craftingInstance in gameStateManager.gameState.crafting.craftQueue)
          CraftingQueueElementWidget(craftingInstance: craftingInstance)
      ],
    );
  }
}

class CraftingQueueElementWidget extends StatelessWidget {
  const CraftingQueueElementWidget({
    super.key,
    required this.craftingInstance,
  });

  final CraftingInstance craftingInstance;

  @override
  Widget build(BuildContext context) {
    var craftingManager = context.watch<CraftingManager>();
    return Row(
      children: [
        Text(craftingInstance.craftingRecipeId),
        TimerDisplayWidget(getTimeLeft: () => _getTimeLeft(context)),
        Spacer(),
        if (craftingManager.canCollect(craftingInstance))
          MyButton(
            onPressed: () {
              craftingManager.collectCraft(craftingInstance);
            },
            child: Text('Collect')
          )
        else
          SizedBox.shrink()
      ]
    );
  }

  Duration _getTimeLeft(BuildContext context) {
    var craftRecipe = context.read<GameDataManager>().getData(craftingInstance.craftingRecipeId)!.components.craftingRecipe;
    var endTime = craftingInstance.startTime.toDateTime().add(craftRecipe.duration.toDart());
    return TimeUtils.timeUntil(TimeUtils.now(), endTime);
  }
}

class CraftingRecipeWidget extends StatelessWidget {
  const CraftingRecipeWidget({
    super.key,
    required this.recipeId,
    required this.recipe,
  });

  final String recipeId;
  final CraftingRecipeComponent recipe;

  @override
  Widget build(BuildContext context) {
    final craftingManager = context.watch<CraftingManager>();
    final gameDataManager = context.watch<GameDataManager>();
    final name = gameDataManager.getData(recipeId)!.components.localizedName.namePlural;

    return Container(
      color: Colors.white24,
      child: Column(
        children: [
          Text(name, style: TextStyle(fontFamily: 'Permanent Marker', fontSize: 18),),
          Row(
            children: [
              Text('Cost:'),
              for (var cost in recipe.cost)
                CraftCostWidget(cost: cost),
              Spacer(),
              Text('Result:'),
              for (var grant in recipe.output)
                CraftResultWidget(grant: grant),
            ],
          ),
          if (craftingManager.canCraft(recipe))
            MyButton(
              onPressed: () {
                craftingManager.startCraft(recipeId, recipe);
              },
              child: Text('Craft')
            )
          else
            SizedBox.shrink()
        ],
      ),
    );
  }
}

class CraftCostWidget extends StatelessWidget {
  const CraftCostWidget({
    super.key,
    required this.cost
  });

  final Requirement cost;

  @override
  Widget build(BuildContext context) {
    var gameDataManager = context.read<GameDataManager>();
    var inventoryManager = context.watch<InventoryManager>();
    
    var costData = gameDataManager.getData(cost.id);

    return Container(
      color: Colors.blueGrey,
      child: SizedBox(
        width: 75, 
        height: 75,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(costData!.components.asset.sprite),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                color: Color(0x80000000),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Text(cost.amount.toString(),
                  style: TextStyle(
                    fontFamily: 'Permanent Marker', 
                    color: inventoryManager.getResourceCount(cost.id) >= cost.amount ? Colors.white : Colors.red
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      )
    );
  }
}

class CraftResultWidget extends StatelessWidget {
  const CraftResultWidget({
    super.key,
    required this.grant
  });

  final Grant grant;

  @override
  Widget build(BuildContext context) {
    var gameDataManager = context.read<GameDataManager>();    
    var grantData = gameDataManager.getData(grant.id);

    return Container(
      color: const Color.fromARGB(255, 229, 208, 70),
      child: SizedBox(
        width: 75, 
        height: 75,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(grantData!.components.asset.sprite),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                color: Color(0x80000000),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Text(grant.amount.toString(),
                  style: TextStyle(
                    fontFamily: 'Permanent Marker', 
                    color: Colors.white
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      )
    );
  }
}