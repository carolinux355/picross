
import 'dart:async';

import 'package:basic/player_lives/player_lives_manager.dart';
import 'package:basic/style/background_frame.dart';
import 'package:basic/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerLivesCompactWidget extends StatelessWidget {
  const PlayerLivesCompactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final playerLivesManager = context.watch<PlayerLivesManager>();

    return ListenableBuilder(
      listenable: playerLivesManager,
      builder: (context, child) { 
        return SizedBox(
          child: BackgroundFrame(
            color: BackgroundFrameColor.beige,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 2,
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      Text('x ${playerLivesManager.getLives()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Permanent Marker'),)
                    ],
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
      child: Text(TimeUtils.formatTime(_timeUntilRefill!), style: TextStyle(color: Colors.white),),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}