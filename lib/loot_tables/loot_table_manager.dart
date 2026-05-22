import 'dart:math';

import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/generated/configuration/Components/LootTableComponent.pb.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/grants/grant_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:logging/logging.dart';

class LootTableManager extends BaseManager {
  
  final Logger logger = Logger('Loot Table Manager');

  @override
  List<Type> dependencies = [GameStateManager];

  late GameStateManager gameStateManager;
  late GrantManager grantManager;
  final Random _random = Random();
  
  @override
  Future initialize(List<BaseManager> managers) async {
    gameStateManager = managers.firstWhere((m) => m.runtimeType == GameStateManager) as GameStateManager;
  }

  @override
  Future? postInitialize(List<BaseManager> allManagers) async {
    grantManager = allManagers.firstWhere((m) => m.runtimeType == GrantManager) as GrantManager;
  }

  List<Grant> execute(LootTableComponent lootTable) {
    List<Grant> results = [];
    // for each roll, execute the outcomes
    for (var roll in lootTable.rolls) {
      _executeRoll(roll, results);
    }
    return results;
  }

  void _executeRoll(LootTableRoll roll, List<Grant> results) {
    switch (roll.type) {
      case LootTableType.LootTableType_Unset:
        throw Exception('unset loot table type!');

      case LootTableType.LootTableType_PercentChance:
        for (var outcome in roll.outcomes) {
          _executePercentChance(outcome, results);
        }
        break;

      case LootTableType.LootTableType_WeightedRoll:
        _executeWeightedRoll(roll.outcomes, results);
        break;
    }
  }

  void _executePercentChance(LootTableOutcome outcome, List<Grant> results) {
    // coin flip
    var flip = _random.nextInt(100) + 1; // 1-100
    if (flip <= outcome.percentChance) {
      _addGrants(outcome.grants, results);
    }
  }

  void _executeWeightedRoll(List<LootTableOutcome> outcomes, List<Grant> results) {
    int totalWeight = 0;
    for (var outcome in outcomes) {
      totalWeight += outcome.weight;
    }

    int roll = _random.nextInt(totalWeight) + 1;
    for (int i = 0; i < outcomes.length; i++) {
      if (roll <= outcomes[i].weight) {
        _addGrants(outcomes[i].grants, results);
        break;
      }
      roll -= outcomes[i].weight;
    }
  }

  void _addGrants(List<Grant> grants, List<Grant> results) {
    for (var grant in grants) {
      results.addAll(grantManager.tryGrant(grant, dryRun: true));
    }
  }
}
