
import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/loot_tables/loot_table_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/player_level/player_level_manager.dart';
import 'package:basic/requirements/requirement_manager.dart';
import 'package:logging/logging.dart';

class GrantManager extends BaseManager {
  
  final Logger logger = Logger('Grant Manager');
  
  @override
  List<Type> dependencies = [GameStateManager, GameDataManager, RequirementManager, InventoryManager, PlayerLevelManager, LootTableManager];

  late GameStateManager gameStateManager;
  late GameDataManager gameDataManager;
  late RequirementManager requirementManager;
  late InventoryManager inventoryManager;
  late PlayerLevelManager playerLevelManager;
  late LootTableManager lootTableManager;
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
    gameDataManager = managers.firstWhere((m) =>  m.runtimeType == GameDataManager) as GameDataManager;
    requirementManager = managers.firstWhere((m) => m.runtimeType == RequirementManager) as RequirementManager;
    inventoryManager = managers.firstWhere((m) => m.runtimeType == InventoryManager) as InventoryManager;
    playerLevelManager = managers.firstWhere((m) => m.runtimeType == PlayerLevelManager) as PlayerLevelManager;
    lootTableManager = managers.firstWhere((m) => m.runtimeType == LootTableManager) as LootTableManager;
  }

  List<Grant> tryGrant(Grant grant, {bool dryRun = false}) {
    List<Grant> results = [];
    // check requirements valid
    if (!requirementManager.evaluateList(grant.requirements)) {
      return results;
    }

    switch (grant.type) {
      case GrantType.GrantType_Unset:
        logger.info('unset grant type!');

      case GrantType.GrantType_Resource:
        if (!dryRun) {
          inventoryManager.addResource(grant.id, grant.amount);
        }
        results.add(grant);

      case GrantType.GrantType_Xp:
        if (!dryRun) {
          gameStateManager.gameState.xp += grant.amount;
          playerLevelManager.onXpGranted();
        }
        results.add(grant);

      case GrantType.GrantType_MaxLivesIncrease:
        if (!dryRun) {
          gameStateManager.gameState.playerLives.maxLives += grant.amount;
        }
        results.add(grant);
    
      case GrantType.GrantType_LootTable:
        // execute loot table and then grant iff !dryRun
        var lootTable = gameDataManager.getData(grant.id)?.components.lootTable;
        if (lootTable!= null) {
          var lootTableResults = lootTableManager.execute(lootTable);
          if (!dryRun) {
            // execute grants for real now (should be all flat types after loot table execution complete)
            results.addAll(tryGrantList(lootTableResults));
          }
        }
    }

    return results;
  }

  List<Grant> tryGrantList(List<Grant> grants, {bool dryRun = false}) {
    List<Grant> results = [];
    for (Grant grant in grants) {
      results.addAll(tryGrant(grant, dryRun: dryRun));
    }
    return results;
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
