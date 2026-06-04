import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/generated/configuration/Requirement.pb.dart';
import 'package:basic/generated/persistence/UpgradeState.pb.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/style/background_frame.dart';
import 'package:basic/upgrades/upgrade_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpgradeWidget extends StatelessWidget {
  const UpgradeWidget({super.key, required this.upgradeState});

  final UpgradeState upgradeState;

  @override
  Widget build(BuildContext context) {
    var upgradeManager = context.watch<UpgradeManager>();
    var inventoryManager = context.watch<InventoryManager>();
    
    return ListenableBuilder(
      listenable: Listenable.merge([upgradeManager, inventoryManager]),
      builder: (context, child) {
        return Column(
          children: [
            BackgroundFrame(
              color: BackgroundFrameColor.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    for (var cost in upgradeManager.getUpgradeCost(upgradeState.currentId))
                      UpgradeCostWidget(cost: cost)
                  ]
                )
              ),
            ),
            ListenableBuilder(
              listenable: inventoryManager,
              builder: (context, child) {
                if (upgradeManager.canAffordUpgrade(upgradeState.currentId))
                {
                  return ElevatedButton(
                    onPressed: () => upgradeManager.executeUpgrade(upgradeState),
                    child: Text('Upgrade')
                  );
                }
                return SizedBox.shrink();
              }
            )
          ],
        );
      }
    );
  }
}

class UpgradeCostWidget extends StatelessWidget {
  const UpgradeCostWidget({
    super.key,
    required this.cost
  });

  final Requirement cost;

  @override
  Widget build(BuildContext context) {
    var gameDataManager = context.read<GameDataManager>();
    var inventoryManager = context.watch<InventoryManager>();
    
    var costData = gameDataManager.getData(cost.id);
    var ownedAmount = inventoryManager.getResourceCount(cost.id);

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
                  child: Text('${ownedAmount.toString()}/${cost.amount.toString()}',
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