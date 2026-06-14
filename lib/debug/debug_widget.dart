import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/tutorial/name_ship_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DebugWidget extends SimpleDialog {
  const DebugWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var grantManager = context.read<GrantManager>();
    var playerLivesManager = context.read<PlayerLivesManager>();
    var gameStateManager = context.read<GameStateManager>();
    
    return SizedBox(
      width: 300,
      height: 300,
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Row(
              children: [
                Text('Debug Menu'),
                Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  child: Text('X')
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => grantManager.tryGrant(Grant(type: GrantType.GrantType_Xp, amount: 100)),
                  child: Text('Grant 100xp')
                ),
                ElevatedButton(
                  onPressed: () => grantManager.tryGrant(Grant(type: GrantType.GrantType_Resource, id: 'resource_coin', amount: 1000)),
                  child: Text('Grant 1000 coins')
                ),
                ElevatedButton(
                  onPressed: () => grantManager.tryGrant(Grant(type: GrantType.GrantType_Resource, id: 'resource_wood', amount: 10)),
                  child: Text('Grant 10 wood')
                ),
                ElevatedButton(
                  onPressed: () => grantManager.tryGrant(Grant(type: GrantType.GrantType_Resource, id: 'resource_stone', amount: 10)),
                  child: Text('Grant 10 stone')
                ),
                ElevatedButton(
                  onPressed: () => grantManager.tryGrant(Grant(type: GrantType.GrantType_Resource, id: 'resource_plank', amount: 10)),
                  child: Text('Grant 10 planks')
                ),
                ElevatedButton(
                  onPressed: () => grantManager.tryGrant(Grant(type: GrantType.GrantType_Resource, id: 'resource_iron_ore', amount: 10)),
                  child: Text('Grant 10 iron ore')
                ),
                ElevatedButton(
                  onPressed: () => playerLivesManager.addLives(1, false),
                  child: Text('Restore Lives (1)')
                ),
                ElevatedButton(
                  onPressed: () => 
                  showDialog(context: context, builder: 
                    (context) => NameShipWidget(
                      onConfirmed: (name) => gameStateManager.gameState.ship.shipName = name
                    ),
                  ),
                  child: Text('Name Your Ship')
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
