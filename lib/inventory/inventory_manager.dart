
import 'dart:math';

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

    return 0;
  }

  void addResource(String resourceId, int amount) {
    gameStateManager.gameState.inventory.resources[resourceId] = getResourceCount(resourceId) + amount;
    gameStateManager.save();
    notifyListeners();
  }

  void removeResource(String resourceId, int amount) {
    if (!gameStateManager.gameState.inventory.resources.containsKey(resourceId) || gameStateManager.gameState.inventory.resources[resourceId]! < amount) {
      throw Exception('failed to remove resource $resourceId:$amount, not enough in inventory!');
    }
    gameStateManager.gameState.inventory.resources[resourceId] = max(0, gameStateManager.gameState.inventory.resources[resourceId]! - amount);
    gameStateManager.save();
    notifyListeners();
  }

  int getPendingResourceAmount(String resourceId) {
    assert(gameDataManager.getData(resourceId)?.components.resource != null);
    if (gameStateManager.gameState.inventory.pendingResources.containsKey(resourceId)) {
      return gameStateManager.gameState.inventory.pendingResources[resourceId]!;
    }

    return 0;
  }

  void addPending(String resourceId, int amount) {
    gameStateManager.gameState.inventory.pendingResources[resourceId] = getPendingResourceAmount(resourceId) + amount;
    gameStateManager.save();
    notifyListeners();
  }

  void removePending(String resourceId, int amount) {
    if (!gameStateManager.gameState.inventory.pendingResources.containsKey(resourceId) || gameStateManager.gameState.inventory.pendingResources[resourceId]! < amount) {
      throw Exception('failed to remove pending resource $resourceId:$amount, not enough in inventory!');
    }
    gameStateManager.gameState.inventory.pendingResources[resourceId] = max(0, gameStateManager.gameState.inventory.pendingResources[resourceId]! - amount);
    gameStateManager.save();
    notifyListeners();
  }

  void flushPending() {
    for (var kvp in gameStateManager.gameState.inventory.pendingResources.entries) {
      // migrate all resources from pending to resources inventory
      addResource(kvp.key, kvp.value);
    }
    gameStateManager.gameState.inventory.pendingResources.clear();
    gameStateManager.save();
  }

}