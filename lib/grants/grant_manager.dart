
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/player_level/player_level_manager.dart';

class GrantManager extends BaseManager {
  
  @override
  List<Type> dependencies = [GameStateManager, InventoryManager, PlayerLevelManager];

  late GameStateManager gameStateManager;
  late InventoryManager inventoryManager;
  late PlayerLevelManager playerLevelManager;
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
    inventoryManager = managers.firstWhere((m) => m.runtimeType == InventoryManager) as InventoryManager;
    playerLevelManager = managers.firstWhere((m) => m.runtimeType == PlayerLevelManager) as PlayerLevelManager;
  }

  bool tryGrant(Grant grant) {
    switch (grant.type) {
      case GrantType.GrantType_Unset:
        return false;

      case GrantType.GrantType_Resource:
        inventoryManager.addResource(grant.id, grant.amount);
        return true;

      case GrantType.GrantType_Xp:
        gameStateManager.gameState.xp += grant.amount;
        playerLevelManager.onXpGranted();
        return true;
    
    }

    return false;
  }

  bool tryGrantList(List<Grant> grants) {
    bool success = true;
    for (Grant grant in grants) {
      success &= tryGrant(grant);
    }
    return success;
  }

  List<Grant> consolidateGrants(List<Grant> grants) {
    List<Grant> consolidatedGrants = [];
    Map<String, int> grantMap = {};
    for (var grant in grants) {
      if (grant.type != GrantType.GrantType_Resource) {
        continue;
      }

      var v = grantMap[grant.id] ?? 0;
      grantMap[grant.id] = v + grant.amount;
    }

    for (var kvp in grantMap.entries) {
      consolidatedGrants.add(Grant(type: GrantType.GrantType_Resource, id: kvp.key, amount: kvp.value));
    }
    return consolidatedGrants;
  }
}
