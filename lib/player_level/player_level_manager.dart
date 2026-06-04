
import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Components/PlayerLevelCurveComponent.pb.dart';
import 'package:basic/generated/persistence/XpState.pb.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:logging/logging.dart';

class PlayerLevelManager extends BaseManager {
  
  Logger logger = Logger('PlayerLevelManager');
  
  @override
  List<Type> dependencies = [GameDataManager, GameStateManager];

  late GameDataManager gameDataManager;
  late GameStateManager gameStateManager;
  // post initialize
  late GrantManager grantManager;

  late PlayerLevelCurveComponent _playerLevelCurveComponent;
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameDataManager = managers.firstWhere((m) => m.runtimeType == GameDataManager) as GameDataManager;
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;

    if (!gameStateManager.gameState.hasXp()) {
      gameStateManager.gameState.xp = XpState();
    }
    _playerLevelCurveComponent = gameDataManager.getData(gameDataManager.getTuning().playerLevelCurveId)!.components.playerLevelCurve;

    // initialize player level for new users
    if (gameStateManager.gameState.playerLevel <= 0) {
      gameStateManager.gameState.playerLevel = 1;
      gameStateManager.save();
    }
  }

  @override
  Future? postInitialize(List<BaseManager> allManagers) {
    grantManager = allManagers.firstWhere((m) => m.runtimeType == GrantManager) as GrantManager;
    return null;
  }

  void onXpGranted() {
    // todo quick and dirty
    tryLevelUp();
    notifyListeners();
  }

  int getPlayerLevel() {
    return gameStateManager.gameState.playerLevel;
  }

  bool isAtMaxLevel() {
    return getNextLevel() == null;
  }

  bool checkCanLevelUp() {
    int xp = gameStateManager.gameState.xp.xp;
    var nextLevel = getNextLevel();
    if (nextLevel == null) {
      return false;
    }
    int xpNeeded = nextLevel.minXp;
    return xp >= xpNeeded;
  }

  PlayerLevelCurveLevel? getNextLevel() {
    int nextLevel = gameStateManager.gameState.playerLevel + 1;
    return _playerLevelCurveComponent.levels[nextLevel.toString()];
  }

  bool tryLevelUp() {
    if (!checkCanLevelUp()) {
      return false;
    }

    // grant rewards
    var nextLevel = getNextLevel();

    logger.info('leveling up player to ${nextLevel!.level}');

    grantManager.tryGrantList(nextLevel.rewards);

    // level up
    gameStateManager.gameState.playerLevel++;
    gameStateManager.save();

    return true;
  }

  void flushPending() {
    if (gameStateManager.gameState.xp.pendingXp > 0) {
      gameStateManager.gameState.xp.xp += gameStateManager.gameState.xp.pendingXp;
      gameStateManager.gameState.xp.pendingXp = 0;
      gameStateManager.save();

      onXpGranted();
    }
  }
}
