
import 'dart:math';

import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/inventory/inventory_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

// this is more of a manager initialization and dependency injecting class
class ServiceProvider {

  final Logger logger = Logger('Service Provider');

  bool isLoading = true;
  final List<BaseManager> _registeredManagers = [];
  final Map<int, List<BaseManager>> _initializationOrder = {}; // mapping for when each manager should initialize
  final Map<Type, int> _managerInitializationOrder = {}; // reverse mapping to look up when this manager initializes

  ServiceProvider();

  Future initializeProvidersAsync(BuildContext context) async {
    _registerManager(context.read<GameStateManager>());
    _registerManager(context.read<GameDataManager>());
    _registerManager(context.read<InventoryManager>());
    _registerManager(context.read<GrantManager>());

    // sort managers to initialize in order of dependencies (need to check for circular dependencies)
    _initializationOrder.clear();
    for (var manager in _registeredManagers) {
      // base case: no dependencies means can initialize immediately
      if (manager.dependencies.isEmpty) {
        if (!_initializationOrder.containsKey(0)) {
          _initializationOrder[0] = [];
        }
        _initializationOrder[0]!.add(manager);
        _managerInitializationOrder[manager.runtimeType] = 0;
      }
      else {
        int maxOrder = 0;
        for (var dependency in manager.dependencies) {
          int order = 0;
          if (_managerInitializationOrder.containsKey(dependency)) {
            order = _managerInitializationOrder[dependency]!;
          }
          maxOrder = max(maxOrder, order + 1);
        }

        if (!_initializationOrder.containsKey(maxOrder)) {
          _initializationOrder[maxOrder] = [];
        }
        _initializationOrder[maxOrder]!.add(manager);
        _managerInitializationOrder[manager.runtimeType] = maxOrder;
      }
    }

    for (var kvp in _initializationOrder.entries) {
      logger.info('${kvp.key}: ${kvp.value}');
      List<Future> futures = [];
      for (var manager in kvp.value) {
        futures.add(_initializeManager(manager));
      }
      await Future.wait(futures);
    }

    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
  }

  void _registerManager(BaseManager manager) {
    _registeredManagers.add(manager);
  }

  Future _initializeManager(BaseManager manager) async {
    List<BaseManager> managers = [];
    for (var dependency in manager.dependencies) {
      var d = _registeredManagers.firstWhere((m) => m.runtimeType == dependency);
      if (!d.didInitialize) {
        logger.info('Manager ${d.runtimeType} is not initialized but ${manager.runtimeType} is dependent on it!');
      }
      managers.add(d);
    }
    await manager.initialize(managers);
    manager.didInitialize = true;
  }
}