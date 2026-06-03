
import 'package:basic/play_session/play_session_powerups_widget.dart';
import 'package:basic/play_session/play_session_screen.dart';
import 'package:basic/style/background_frame.dart';
import 'package:flutter/material.dart';

/// This widget defines the bottom HUD during a picross game
class PlaySessionBottomBarWidget extends StatelessWidget {
  const PlaySessionBottomBarWidget({super.key, required this.playerSessionState});

  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 120,
            child: BackgroundFrame(
              color: BackgroundFrameColor.grey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    PlaySessionPowerupsWidget(),
                    Spacer(),
                    PlaySessionBottomBarInputWidget(playerSessionState: playerSessionState),
                  ],
                ),
              ),
            ),
          ),
        )
      ]
    );
  }
}

class PlaySessionBottomBarInputWidget extends StatelessWidget {
  const PlaySessionBottomBarInputWidget({super.key, required this.playerSessionState});

  final PlaySessionScreenState playerSessionState;

  @override
  Widget build(BuildContext context) {

    final selectedBackground = AssetImage('assets/icons/ui/buttonSquare_brown_pressed.png');
    final unselectedBackground = AssetImage('assets/icons/ui/buttonSquare_beige.png');

    final inputMode = playerSessionState.getInputMode();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 0,
          children: [
            SizedBox(
              width: 50,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: inputMode == PlayerSessionInputMode.reveal ? selectedBackground : unselectedBackground)
                ),
                child: IconButton(
                  onPressed: () {
                    playerSessionState.setInputMode(PlayerSessionInputMode.reveal);
                  }, 
                  icon: Icon(Icons.edit, color: inputMode == PlayerSessionInputMode.reveal ? Colors.white : Colors.black)
                )
              )
            ),
            SizedBox(
              width: 50,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: inputMode == PlayerSessionInputMode.mark ? selectedBackground : unselectedBackground)
                ),
                child: IconButton(
                  onPressed: () {
                    playerSessionState.setInputMode(PlayerSessionInputMode.mark);
                  }, 
                  icon: Icon(Icons.flag, color: inputMode == PlayerSessionInputMode.mark ? Colors.white : Colors.black)
                )
              )
            ),
          ],
        ),
      ]
    );
  }
}