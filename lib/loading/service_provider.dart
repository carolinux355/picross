import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceProvider {

  bool isLoading = true;

  ServiceProvider();

  Future initializeProvidersAsync(BuildContext context) async {
    var gameStateManager = context.read<GameStateManager>();
    var gameDataManager = context.read<GameDataManager>();

    await gameStateManager.initialize();
    await gameDataManager.initialize();

    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
  }
}