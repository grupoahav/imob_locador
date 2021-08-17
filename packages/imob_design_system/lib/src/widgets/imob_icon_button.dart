import 'package:flutter/material.dart';

class ImobIconButton extends IconButton {
  const ImobIconButton({
    required Widget icon,
    required void Function()? onPressed,
    double iconSize = 24.0,
    Key? key,
  }) : super(
          key: key,
          icon: icon,
          onPressed: onPressed,
          iconSize: iconSize,
          splashRadius: kToolbarHeight / 2 - 4,
        );
}
