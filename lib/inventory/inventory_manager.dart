
import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/persistence/InventoryState.pb.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:logging/logging.dart';

enum InventoryType {
  resources,
  pending
}

class InventoryManager extends BaseManager
{
  
  Logger logger = Logger('Inventory Manager');
  
  @override List<Type> dependencies = [GameStateManager, GameDataManager];

  late GameStateManager gameStateManager;
  late GameDataManager gameDataManager;

  @override
  Future initialize(List<BaseManager> managers) async {
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
    gameDataManager = managers.firstWhere((m) => m.runtimeType == GameDataManager) as GameDataManager;
    if (!gameStateManager.gameState.hasInventory()) {
      gameStateManager.gameState.inventory = InventoryState();
    }
  }

  int getResourceCount(String resourceId) {
    assert(gameDataManager.getData(resourceId)?.components.resource != null);
    if (gameStateManager.gameState.inventory.resources.containsKey(resourceId)) {
      return gameStateManager.gameState.inventory.resources[resourceId]!;
    }

    var resourcesMap = gameStateManager.gameState.inventory.resources;
    resourcesMap['resource_coin'] = 0;
    return 0;
  }

  void addResource(String resourceId, int amount) {
    gameStateManager.gameState.inventory.resources[resourceId] = getResourceCount(resourceId) + amount;
    notifyListeners();
  }

  void removeResource(String resourceId, int amount) {
    if (!gameStateManager.gameState.inventory.resources.containsKey(resourceId) || gameStateManager.gameState.inventory.resources[resourceId]! < amount) {
      throw Exception('failed to remove resource $resourceId:$amount, not enough in inventory!');
    }
    gameStateManager.gameState.inventory.resources[resourceId] = gameStateManager.gameState.inventory.resources[resourceId]! - amount;
    notifyListeners();
  }

}