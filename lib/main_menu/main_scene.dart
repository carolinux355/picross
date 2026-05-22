import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/main_menu/upgrade_widget.dart';
import 'package:basic/ships/ship_manager.dart';
import 'package:basic/upgrades/upgrade_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// draws the scene with the player's town/boat state
class MainSceneWidget extends StatelessWidget {
  const MainSceneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var shipManager = context.read<ShipManager>();
    var shipState = shipManager.getDefaultShip();

    return Column(
      children: [
        Spacer(),
        UpgradeWidget(upgradableId: shipState.upgradeState.currentId, upgradeState: shipState.upgradeState,),
        Center(
          child: ShipView()
        )
      ]
    );
  }
}

class ShipView extends StatefulWidget {
  const ShipView({
    super.key,
  });

  @override
  State<ShipView> createState() => _ShipViewState();
}

class _ShipViewState extends State<ShipView> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late AnimationController _rotateAnimationController;
  late Animation<double> _animation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this
    );
    _rotateAnimationController = AnimationController(
      duration: Duration(milliseconds: 2200),
      vsync: this
    );
    _animation = Tween<double>(begin: 0, end: 5).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutSine));
    _rotateAnimation = Tween<double>(begin: 0, end: 0.05).animate(CurvedAnimation(parent: _rotateAnimationController, curve: Curves.easeInOutSine));

    _animationController.repeat(reverse: true);
    _rotateAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _rotateAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var gameDataManager = context.read<GameDataManager>();
    var shipManager = context.read<ShipManager>();
    var upgradeManager = context.watch<UpgradeManager>();

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _animation.value),
        child: AnimatedBuilder(
          animation: _rotateAnimation,
          builder: (context, child) => Transform.rotate(
            alignment: AlignmentGeometry.bottomCenter,
            angle: _rotateAnimation.value,
            child: ListenableBuilder(
              listenable: upgradeManager,
              builder: (context, value) {
                var shipState = shipManager.getDefaultShip();
                var shipData = gameDataManager.getData(shipState.upgradeState.currentId);
                return Image.asset(
                  shipData!.components.asset.sprite,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
      )
    );
  }
}