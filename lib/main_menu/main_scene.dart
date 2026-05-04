import 'package:flutter/material.dart';

// draws the scene with the player's town/boat state
class MainSceneWidget extends StatelessWidget {
  const MainSceneWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.lightBlueAccent,
      child: Row(
        children: [
          Center(child: Text('really pretty art scene here', textAlign: TextAlign.center,))
        ],
      ),
    );
  }
}