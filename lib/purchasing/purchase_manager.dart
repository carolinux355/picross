import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/requirements/requirement_manager.dart';
import 'package:logging/logging.dart';

// for now manages in game purchases, may extend to include IAP in the future
class PurchaseManager extends BaseManager {

  Logger logger = Logger('PurchaseManager');
  
  @override
  List<Type> dependencies = [GameDataManager, GameStateManager, RequirementManager, GrantManager];

  late GameDataManager gameDataManager;
  late GameStateManager gameStateManager;
  late RequirementManager requirementManager;
  late GrantManager grantManager;
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameDataManager = managers.firstWhere((m) => m.runtimeType == GameDataManager) as GameDataManager;
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
    requirementManager = managers.firstWhere((m) => m.runtimeType == RequirementManager) as RequirementManager;
    grantManager = managers.firstWhere((m) => m.runtimeType == GrantManager) as GrantManager;
  }

  bool tryMakeInGamePurchase(String id) {
    var data = gameDataManager.getData(id);
    if (data == null || !data.components.hasPurchasable()) { 
      return false;
    }

    var purchasable = data.components.purchasable;

    if (!requirementManager.evaluateList(purchasable.unlock)) {
      logger.info('Purchase $id is not unlocked');
      return false;
    }

    if (!requirementManager.evaluateCosts(purchasable.cost)) {
      logger.info('Cannot afford purchase $id');
      return false;
    }

    if (!requirementManager.consumeCost(purchasable.cost)) {
      logger.info('Failed to consume cost for purchase $id');
      return false;
    }

    grantManager.tryGrantList(purchasable.grants);
    return true;
  }

}
