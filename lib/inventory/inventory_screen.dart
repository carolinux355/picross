import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/constants.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/style/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/my_button.dart';
import '../style/palette.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final gameDataManager = context.watch<GameDataManager>();
    final tuning = gameDataManager.getData(Constants.TUNING_CONFIG_ID)!.components.tuning;

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
                  'Inventory',
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            //const SizedBox(height: 50),
            Expanded(
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: [
                  for (var resource in tuning.inventoryResources)
                    InventoryItemView(palette: palette, resourceId: resource),
                ],
              ),
            ),
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

class InventoryItemView extends StatelessWidget {
  const InventoryItemView({
    super.key,
    required this.palette,
    required this.resourceId
  });

  final Palette palette;
  final String resourceId;

  @override
  Widget build(BuildContext context) {
    var inventoryManager = context.watch<InventoryManager>();
    var gameDataManager = context.watch<GameDataManager>();
    var data = gameDataManager.getData(resourceId);
    
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: palette.backgroundMain,
        child: Center(
          child: Stack(
            children: [
              Image.asset(data!.components.asset.sprite),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(
                  '${inventoryManager.getResourceCount(resourceId)}', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 18,
                  )
                ),
              ),
            ]
          ),
        )
      ),
    );
  }
}
