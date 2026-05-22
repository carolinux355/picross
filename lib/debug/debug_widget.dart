import 'package:flutter/material.dart';

class DebugWidget extends SimpleDialog {
  const DebugWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Container(
        color: Colors.red,
        child: Text('Debug Widget'),
      ),
    );
  }
}
