import 'package:flutter/material.dart';

enum BackgroundFrameColor { beige, brown, blue, grey }
class BackgroundFrame extends StatelessWidget {
  const BackgroundFrame({super.key, required this.child, required this.color});

  final Widget child;
  final BackgroundFrameColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/ui/buttonLong_${color.name}_pressed.png'),
          fit: BoxFit.fill,
          centerSlice: Rect.fromLTWH(8, 8, 175, 29)
        ),
      ),
      child: child
    );
  }
}