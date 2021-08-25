import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class ImobLineStep extends StatelessWidget {
  const ImobLineStep({
    Key? key,
    required this.color,
    this.isHorizontal = false,
  }) : super(key: key);

  final Color color;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHorizontal ? 64.scale : 1.0,
      height: isHorizontal ? 1.0 : 64.0.scale,
      color: color,
    );
  }
}
