
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/inventory/inventory_manager.dart';

class GrantManager extends BaseManager {
  
  @override
  List<Type> dependencies = [InventoryManager];

  late InventoryManager inventoryManager;
  
  @override
  Future initialize(List<BaseManager> managers) async {
    inventoryManager = managers.firstWhere((m) => m.runtimeType == InventoryManager) as InventoryManager;
  }

  bool tryGrant(Grant grant) {
    if (grant.type == GrantType.GrantType_Resource) {
      inventoryManager.addResource(grant.id, grant.amount);
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
      consolidatedGrants.add(new Grant(type: GrantType.GrantType_Resource, id: kvp.key, amount: kvp.value));
    }
    return consolidatedGrants;
  }
}
