import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/shared_widgets/player_lives_compact_widget.dart';
import 'package:basic/shared_widgets/xp_widget.dart';
import 'package:basic/style/background_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generic wallet widget for showing xp, coins, etc on various screens
class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key, this.showXP = true, this.showPlayerLives = true, this.showCoins = true, this.showPremium = true});

  final bool showXP;
  final bool showPlayerLives;
  final bool showCoins;
  final bool showPremium;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        if (showXP) XPWidget(),
        if (showPlayerLives) PlayerLivesCompactWidget(),
        if (showCoins) WalletResourceWidget(resourceId: 'resource_coin',),
        if (showPremium) WalletResourceWidget(resourceId: 'resource_premium',),
      ],
    );
  }
}

class WalletResourceWidget extends StatelessWidget {
  final String resourceId;

  const WalletResourceWidget({super.key, required this.resourceId});

  @override
  Widget build(BuildContext context) {
    final gameDataManager = context.watch<GameDataManager>();
    final inventoryManager = context.watch<InventoryManager>();

    var data = gameDataManager.getData(resourceId);
    var icon = Image.asset(data!.components.asset.sprite);
    var iconBackground = Image.asset('assets/icons/ui/buttonRound_beige.png');
    
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: iconBackground.image, 
              fit: BoxFit.fill,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: icon.image, width: 20, height: 20,),
          )
        ),
        BackgroundFrame(
          color: BackgroundFrameColor.beige,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 25,
              child: Center(
                child: Text('${inventoryManager.getResourceCount(resourceId)}', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}