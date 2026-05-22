
import 'dart:async';

import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerLivesWidget extends StatelessWidget {
  const PlayerLivesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final playerLivesManager = context.watch<PlayerLivesManager>();
    final image = Image.asset('assets/icons/cloud5.png');

    return ListenableBuilder(
      listenable: playerLivesManager,
      builder: (context, child) { 
        return SizedBox(
          height: 100,
          width: 100,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: image.image)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('${playerLivesManager.getLives()} / ${playerLivesManager.getMaxLives()}', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 20
                    ),
                  ),
                ),
                TimerDisplayWidget(getTimeLeft: () => playerLivesManager.getTimeUntilNextRefill()),
              ],
            ),
          ),
        );
      }
    );
  }
}

class TimerDisplayWidget extends StatefulWidget {
  const TimerDisplayWidget({
    super.key,
    required this.getTimeLeft
  });

  final Duration? Function() getTimeLeft;

  @override
  State<TimerDisplayWidget> createState() => _TimerDisplayWidgetState();
}

class _TimerDisplayWidgetState extends State<TimerDisplayWidget> {
  Timer? _timer;
  Duration? _timeUntilRefill;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeUntilRefill = widget.getTimeLeft();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_timeUntilRefill == null || _timeUntilRefill!.isNegative) {
      return Container();
    }
    return Container(
      color: Colors.blueGrey,
      child: Text(TimeUtils.formatTime(_timeUntilRefill!))
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}