
import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Requirement.pb.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:logging/logging.dart';

class RequirementManager extends BaseManager {
  
  Logger logger = Logger('Requirement Manager');
  
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

  bool evaluate(Requirement requirement, {ComparisonType defaultComparison = ComparisonType.ComparisonType_Invalid}) {
    int value = _getValue(requirement);
    return _checkComparison(requirement, value, defaultComparison: defaultComparison);
  }

  bool evaluateList(List<Requirement> requirements, {ComparisonType defaultComparison = ComparisonType.ComparisonType_Invalid}) {

    for (var req in requirements) {
      if (!evaluate(req, defaultComparison: defaultComparison)) {
        return false;
      }
    }

    return true;
  }

  bool evaluateCosts(List<Requirement> costs) {
    return evaluateList(costs, defaultComparison: ComparisonType.ComparisonType_GreaterThanOrEqual);
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

  bool _checkComparison(Requirement requirement, int value, {ComparisonType defaultComparison = ComparisonType.ComparisonType_Invalid}) {
    ComparisonType comparisonType = requirement.comparison;
    if (requirement.comparison == ComparisonType.ComparisonType_Invalid && defaultComparison != ComparisonType.ComparisonType_Invalid) {
      comparisonType = defaultComparison;
    }
    switch (comparisonType) {
      case ComparisonType.ComparisonType_Invalid:
        throw Exception('invalid comparison type!');

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

  bool consumeCost(List<Requirement> requirements) {
    if (!evaluateCosts(requirements)){
      return false;
    }

    for (var requirement in requirements) {
      _consumeCost(requirement);
    }
    return true;
  }

  void _consumeCost(Requirement requirement) {
    if (requirement.type != RequirementType.RequirementType_Resource) {
      throw Exception('Cannot consume non-resource requirement ${requirement.type}:${requirement.id}:${requirement.amount}!');
    }

    inventoryManager.removeResource(requirement.id, requirement.amount);
  }
}
