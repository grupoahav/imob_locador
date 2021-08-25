import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../../domain/enums/registration_progress_enum.dart';

class ImobStep extends StatelessWidget {
  const ImobStep({
    Key? key,
    required this.progress,
  }) : super(key: key);

  final EnumRegistrationProgress progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: progress.color,
          width: 2.scale,
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(4.0.scale),
        height: 16.scale,
        width: 16.scale,
        decoration: BoxDecoration(
          color: progress.isNotStarted ? Colors.transparent : progress.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
