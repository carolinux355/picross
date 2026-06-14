
import 'package:basic/configuration/game_data_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/palette.dart';
import '../style/responsive_screen.dart';

class UpgradeShipScreen extends StatefulWidget {

  const UpgradeShipScreen({super.key, required this.oldShipId});

  final String oldShipId;

  @override
  State<UpgradeShipScreen> createState() => _UpgradeShipScreenState();
}

class _UpgradeShipScreenState extends State<UpgradeShipScreen> {

  int tapCounter = 0;
  final kRequiredTapCount = 3;

  double _scale = 1.0;
  bool _didTransformShip = false;
  bool _flashSpriteVisible = false;
  double _flashSpriteScale = 0.3;
  double _flashSpriteAlpha = 0.0;

  @override 
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final gameDataManager = context.read<GameDataManager>();

    var oldShip = gameDataManager.getData(widget.oldShipId);
    var newShip = gameDataManager.getData(oldShip!.components.upgradable.nextId);

    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () => { 
                    setState(() {
                    tapCounter = tapCounter + 1;
                    if (tapCounter >= kRequiredTapCount) {
                      _playUpgradeAnimation();
                    } else {
                      _playTapAnimation();
                    }
                    })
                  },
                  child: Column(
                    children: [
                      Text('Tap to Upgrade! ($tapCounter / $kRequiredTapCount)', style: TextStyle(fontFamily: 'Permanent Marker', fontSize: 36),),
                      AnimatedScale(
                        curve: Curves.bounceOut,
                        scale: _scale,
                        duration: Duration(milliseconds: 300),
                        child: _didTransformShip ? Image.asset(newShip!.components.asset.sprite) : Image.asset(oldShip.components.asset.sprite)
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: _flashSpriteVisible,
                  child: AnimatedScale(
                    scale: _flashSpriteScale,
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 350),
                    child: AnimatedOpacity(
                      opacity: _flashSpriteAlpha,
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 350),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 24.0),
                        child: Center(
                          child: Image.asset('assets/vfx/burst.png')),
                      ),
                    )
                  )
                )
              ],
            ),
          ]
        ),
        rectangularMenuArea: SizedBox()
      ),
    );
  }

  Future _playTapAnimation() async {
    setState(() {
      _scale = 1.0 + 0.5*(tapCounter);
    });
    await Future.delayed(Duration(milliseconds: 150));
    setState(() {
      _scale = 1.0;
    });
  }

  Future _playUpgradeAnimation() async {
    setState(() {
      _flashSpriteVisible = true;
      _flashSpriteScale = 0.1;
      _flashSpriteAlpha = 0.0;
    });
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _flashSpriteAlpha = 1.0;
      _flashSpriteScale = 30.0;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _didTransformShip = true;
      _flashSpriteAlpha = 0.0; // fade out burst sprite
    });
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) {
      GoRouter.of(context).pop();
    }
  }
}
