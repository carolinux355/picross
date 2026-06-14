
import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/persistence/ShipState.pb.dart';
import 'package:basic/generated/persistence/UpgradeState.pb.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/upgrades/upgrade_manager.dart';
import 'package:logging/logging.dart';

class ShipManager extends BaseManager {
  
  Logger logger = Logger('ShipManager');
  
  @override
  List<Type> dependencies = [GameDataManager, GameStateManager, UpgradeManager];

  late GameDataManager gameDataManager;
  late GameStateManager gameStateManager;
  late UpgradeManager upgradeManager;
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameDataManager = managers.firstWhere((m) => m.runtimeType == GameDataManager) as GameDataManager;
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
    upgradeManager = managers.firstWhere((m)=> m.runtimeType == UpgradeManager) as UpgradeManager;

    // init state for new users
    if (!gameStateManager.gameState.hasShip()) {
      String shipId = gameDataManager.getTuning().shipId;
      var ship = ShipState(id: shipId);
      ship.upgradeState = UpgradeState(currentId: shipId);
      gameStateManager.gameState.ship = ship;
      gameStateManager.save();
    }
  }

  ShipState getDefaultShip() {
    return gameStateManager.gameState.ship;
  }
}
