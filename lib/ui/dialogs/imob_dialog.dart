import 'package:flutter/material.dart';
import 'package:imob_design_system/colors/colors.dart';

class ImobDialog extends StatelessWidget {

  ImobDialog(this.title, this.description, {this.onOkButtonPressed});

  final String title;
  final String description;
  final Function? onOkButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        MaterialButton(
          child: Text("OK"),
            textColor: ImobColors.primaryColor,
            onPressed: () {
          onOkButtonPressed is Function? onOkButtonPressed!() : null;
          Navigator.of(context).pop();
        })
      ],
    );
  }
}