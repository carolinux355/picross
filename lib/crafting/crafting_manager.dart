import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Components/CraftingRecipeComponent.pb.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/generated/persistence/CraftingState.pb.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/requirements/requirement_manager.dart';
import 'package:basic/utils/time_utils.dart';
import 'package:logging/logging.dart';

class CraftingManager extends BaseManager {

  Logger logger = Logger('CraftingManager');
  
  @override
  List<Type> dependencies = [GameDataManager, GameStateManager, RequirementManager, GrantManager, InventoryManager];

  late GameDataManager gameDataManager;
  late GameStateManager gameStateManager;
  late RequirementManager requirementManager;
  late GrantManager grantManager;
  late InventoryManager inventoryManager;

  Map<String, CraftingRecipeComponent> craftingRecipes = {};
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameDataManager = managers.firstWhere((m) => m.runtimeType == GameDataManager) as GameDataManager;
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
    requirementManager = managers.firstWhere((m) => m.runtimeType == RequirementManager) as RequirementManager;
    grantManager = managers.firstWhere((m) => m.runtimeType == GrantManager) as GrantManager;

    if (!gameStateManager.gameState.hasCrafting()) {
      gameStateManager.gameState.crafting = CraftingState();
      gameStateManager.gameState.crafting.maxQueueSize = 1;
    }

    _initCraftingRecipes();
  }

  void _initCraftingRecipes() {
    for (var data in gameDataManager.getAllData()) {
      if (data.components.hasCraftingRecipe()) {
        craftingRecipes[data.id] = data.components.craftingRecipe;
      }
    }
  }

  List<String> getAllCraftingRecipes() {
    return craftingRecipes.keys.toList();
  }

  bool isRecipeOwned(String recipeId) {
    return inventoryManager.getResourceCount(recipeId) > 0;
  }

  bool canCraft(CraftingRecipeComponent recipe) {
    if (gameStateManager.gameState.crafting.craftQueue.length >= gameStateManager.gameState.crafting.maxQueueSize) {
      return false;
    }
    return requirementManager.evaluateCosts(recipe.cost);
  }

  void startCraft(String recipeId, CraftingRecipeComponent recipe) {
    if (!canCraft(recipe)) {
      logger.info('Cannot craft $recipeId, requirements not met');
      return;
    }

    if (!requirementManager.consumeCost(recipe.cost)) {
      logger.warning('Failed to consume cost for crafting $recipeId after passing evaluation');
      return;
    }

    List<Grant> results = grantManager.tryGrantList(recipe.output, dryRun: true);
    var craftingInstance = CraftingInstance(craftingRecipeId: recipeId, startTime: TimeUtils.nowTimestamp(), grants: results);
    gameStateManager.gameState.crafting.craftQueue.add(craftingInstance);
    gameStateManager.save();
    notifyListeners();

    // schedule notification for craft completion
    Future.delayed(Duration(seconds: recipe.duration.toDart().inSeconds), () {
      notifyListeners();
    });
  }

  bool canCollect(CraftingInstance instance) {
    var craftRecipe = craftingRecipes[instance.craftingRecipeId]!;
    var endTime = instance.startTime.toDateTime().add(craftRecipe.duration.toDart());
    return TimeUtils.now().isAfter(endTime);
  }

  void collectCraft(CraftingInstance instance) {
    if (!canCollect(instance)) {
      logger.info('Cannot collect craft ${instance.craftingRecipeId}, not completed yet');
      return;
    }

    grantManager.tryGrantList(instance.grants);
    gameStateManager.gameState.crafting.craftQueue.remove(instance);
    gameStateManager.save();
    notifyListeners();
  }
}
