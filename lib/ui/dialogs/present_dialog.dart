import 'package:flutter/material.dart';
import 'package:imob/ui/dialogs/imob_dialog.dart';

class PresentDialog {
  static show(BuildContext context, ImobDialog dialog) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
