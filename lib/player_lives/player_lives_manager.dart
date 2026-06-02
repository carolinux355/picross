

import 'dart:core';
import 'dart:math';

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Components/TuningComponent.pb.dart';
import 'package:basic/generated/persistence/PlayerLivesState.pb.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/utils/time_utils.dart';
import 'package:logging/logging.dart';

class PlayerLivesManager extends BaseManager {
  
  Logger logger = Logger('Player Lives Manager');

  @override
  List<Type> get dependencies => [GameStateManager, GameDataManager];

  late GameStateManager gameStateManager;
  late GameDataManager gameDataManager;
  late TuningComponent tuningComponent;

  static const int _kInitialLives = 3;
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
    gameDataManager = managers.firstWhere((m) => m.runtimeType == GameDataManager) as GameDataManager;
    if (!gameStateManager.gameState.hasPlayerLives()) {
      gameStateManager.gameState.playerLives = PlayerLivesState();
      gameStateManager.gameState.playerLives.maxLives = _kInitialLives;
      gameStateManager.gameState.playerLives.numLives = _kInitialLives;
    }

    tuningComponent = gameDataManager.getTuning();

    _refillOnInitialize();

    if (!isLivesFull()) {
      _scheduleNextRefill();
    }
  }

  void _refillOnInitialize() {
    // get number of periods since last refill and increment that many times
    int numPeriods = (TimeUtils.timeSince(TimeUtils.now(), gameStateManager.gameState.playerLives.lastRefillTime.toDateTime()).inMilliseconds / tuningComponent.lifeRefillDuration.toDart().inMilliseconds).floor();
    addLives(numPeriods, false);
  }

  void removeLives(int numLives) {
    bool doSchedule = false;
    if (isLivesFull()) {
      gameStateManager.gameState.playerLives.lastRefillTime = TimeUtils.nowTimestamp();
      doSchedule = true;
    }
    gameStateManager.gameState.playerLives.numLives = max(gameStateManager.gameState.playerLives.numLives - numLives, 0);
    gameStateManager.save();
    notifyListeners();
    if (doSchedule) {
      _scheduleNextRefill();
    }
  }

  void addLives(int numLives, bool canExceedMax) {
    if (canExceedMax) {
      gameStateManager.gameState.playerLives.numLives += numLives;
    } else {
      gameStateManager.gameState.playerLives.numLives = min(gameStateManager.gameState.playerLives.numLives + numLives, gameStateManager.gameState.playerLives.maxLives);      
    }
    gameStateManager.gameState.playerLives.lastRefillTime = TimeUtils.nowTimestamp();
    gameStateManager.save();
    notifyListeners();
  }

  void addMaxLives(int numLives) {
    gameStateManager.gameState.playerLives.maxLives += numLives;
    gameStateManager.gameState.playerLives.numLives += numLives;
    gameStateManager.save();
    notifyListeners();
  }

  int getLives() {
    return gameStateManager.gameState.playerLives.numLives;
  }

  int getMaxLives() {
    return gameStateManager.gameState.playerLives.maxLives;
  }

  bool isLivesFull() {
    return gameStateManager.gameState.playerLives.numLives >= gameStateManager.gameState.playerLives.maxLives;
  }

  Duration? getTimeUntilNextRefill() {
    if (!gameStateManager.gameState.playerLives.hasLastRefillTime()) {
      return null;
    }
    if (isLivesFull()) {
      return null;
    }

    // get how much time has passed since last refill
    var now = TimeUtils.now();
    var next = gameStateManager.gameState.playerLives.lastRefillTime.toDateTime().add(gameDataManager.getTuning().lifeRefillDuration.toDart());
    var timeLeft = TimeUtils.timeUntil(now, next);
    return timeLeft;
  }

  Future _scheduleNextRefill() async {
    if (isLivesFull()) {
      return;
    }
    var nextRefill = getTimeUntilNextRefill();
    if (nextRefill != null) {
      Future.delayed(nextRefill).then((result) {
        logger.info('refilling 1 life!');
        addLives(1, false);
        if (!isLivesFull()) {
          _scheduleNextRefill();
        }
      });
    }
  }
}
