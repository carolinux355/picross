import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/style/background_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardView extends StatelessWidget {

  final Grant reward;

  const RewardView({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: BackgroundFrame(
          color: BackgroundFrameColor.blue,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.asset(_getRewardSprite(context))),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(reward.amount.toString(), 
                    textAlign: TextAlign.right, 
                    style: TextStyle(color: Colors.white, fontSize: 16)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getRewardSprite(BuildContext context) {
    var gameDataManager = context.watch<GameDataManager>();
    var data = gameDataManager.getData(reward.id);
    if (data?.components.asset.sprite != null) {
      return data!.components.asset.sprite;
    }

    // TODO: default asset for now, replace with custom sprites for custom reward types
    return "assets/icons/ui/swirl_red.png";
  }
}
