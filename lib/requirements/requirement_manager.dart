
import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Requirement.pb.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';

class RequirementManager extends BaseManager {
  
  @override
  List<Type> dependencies = [GameDataManager, GameStateManager, InventoryManager];

  late GameDataManager gameDataManager;
  late GameStateManager gameStateManager;
  late InventoryManager inventoryManager;
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameDataManager = managers.firstWhere((m) => m.runtimeType == GameDataManager) as GameDataManager;
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
    inventoryManager = managers.firstWhere((m) => m.runtimeType == InventoryManager) as InventoryManager;
  }

  bool evaluate(Requirement requirement) {
    int value = _getValue(requirement);
    return _checkComparison(requirement, value);
  }

  bool evaluateList(List<Requirement> requirements) {

    for (var req in requirements) {
      if (!evaluate(req)) {
        return false;
      }
    }

    return true;
  }

  int _getValue(Requirement requirement) {
    switch (requirement.type) {
      case RequirementType.RequirementType_Unset:
        return 0;

      case RequirementType.RequirementType_PlayerLevel:
        return gameStateManager.gameState.playerLevel;

      case RequirementType.RequirementType_Resource:
        return inventoryManager.getResourceCount(requirement.id);
    }

    return 0;
  }

  bool _checkComparison(Requirement requirement, int value) {
    switch (requirement.comparison) {
      case ComparisonType.ComparisonType_Invalid:
        return false;

      case ComparisonType.ComparisonType_Equal:
        return value == requirement.amount;

      case ComparisonType.ComparisonType_GreaterThan:
        return value > requirement.amount;

      case ComparisonType.ComparisonType_GreaterThanOrEqual:
        return value >= requirement.amount;

      case ComparisonType.ComparisonType_LessThan:
        return value < requirement.amount;

      case ComparisonType.ComparisonType_LessThanOrEqual:
        return value <= requirement.amount;
    }
    return false;
  }
}
