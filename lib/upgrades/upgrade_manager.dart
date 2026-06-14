
import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Requirement.pb.dart';
import 'package:basic/generated/persistence/UpgradeState.pb.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/requirements/requirement_manager.dart';
import 'package:logging/logging.dart';

class UpgradeManager extends BaseManager {
  
  Logger logger = Logger('UpgradeManager');
  
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

  List<Requirement> getUpgradeCost(String id) {
    var data = gameDataManager.getData(id)?.components.upgradable;
    if (data == null) { 
      return [];
    }
    return data.cost;
  }

  bool isAtMaxLevel(String id) {
    var data = gameDataManager.getData(id);
    if (data == null || !data.components.hasUpgradable()) { 
      return true;
    }

    return false;
  }

  bool canAffordUpgrade(String id) {
    var data = gameDataManager.getData(id);
    if (data == null || !data.components.hasUpgradable()) { 
      return false;
    }
    return requirementManager.evaluateCosts(data.components.upgradable.cost);
  }

  bool executeUpgrade(UpgradeState state) {
    if (!canAffordUpgrade(state.currentId)) {
      return false;
    }

    var data = gameDataManager.getData(state.currentId)?.components.upgradable;
    if (data == null || data.nextId.isEmpty) {
      return false;
    }

    if (!requirementManager.consumeCost(data.cost)) {
      return false;
    }

    // update id
    state.currentId = data.nextId;

    // grant rewards
    grantManager.tryGrantList(data.grants);

    gameStateManager.save();
    notifyListeners();
    return true;
  }
}
