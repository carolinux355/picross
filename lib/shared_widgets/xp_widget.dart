import 'package:basic/persistence/game_state_manager.dart';
import 'package:basic/player_level/player_level_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// draws the scene with the player's town/boat state
class XPWidget extends StatelessWidget {
  const XPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final gameStateManager = context.watch<GameStateManager>();
    final playerLevelManager = context.watch<PlayerLevelManager>();
    final image = Image.asset('assets/icons/ui/iconCircle_grey.png');

    final xp = gameStateManager.gameState.xp.xp;

    return ListenableBuilder(
      listenable: playerLevelManager,
      builder: (context, child) { 
        return SizedBox(
          height: 75,
          width: 75,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: image.image, fit: BoxFit.fill)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('${gameStateManager.gameState.playerLevel}', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 24
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: xp.toDouble(), end: gameStateManager.gameState.xp.xp.toDouble()),
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeOut,
                  builder: (context, value, child) => Text(playerLevelManager.isAtMaxLevel() ? '${value.toInt()}' : '${value.toInt()} / ${playerLevelManager.getNextLevel()?.minXp}', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 12
                    ),
                  )
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}