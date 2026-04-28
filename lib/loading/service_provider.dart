import 'package:basic/persistence/game_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceProvider {

  bool isLoading = true;

  ServiceProvider();

  Future initializeProvidersAsync(BuildContext context) async {
    var gameStateManager = context.watch<GameStateManager>();
    await gameStateManager.initialize();
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
  }
}