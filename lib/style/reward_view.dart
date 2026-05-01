import 'package:basic/configuration/game_data_manager.dart';
import 'package:basic/generated/configuration/Grant.pb.dart';
import 'package:basic/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardView extends StatelessWidget {

  final Grant reward;
  const RewardView({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    var palette = context.watch<Palette>();
    var gameDataManager = context.watch<GameDataManager>();
    var data = gameDataManager.getData(reward.id);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Container(
          color: palette.background4,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(data!.components.asset.sprite),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(reward.amount.toString(), textAlign: TextAlign.right,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
