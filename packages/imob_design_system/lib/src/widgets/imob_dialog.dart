import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class ImobDialog extends StatelessWidget {
  static Future<dynamic> show({
    required BuildContext context,
    required String title,
    required String description,
    bool useRootNavigator = false,
    bool barrierDismissible = true,
  }) async {
    final result = await showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (_) => ImobDialog(
        title: title,
        description: description,
      ),
      barrierDismissible: barrierDismissible,
    );

    return result;
  }

  const ImobDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.scale),
      ),
      elevation: 0,
      backgroundColor: theme.cardColor,
      child: Padding(
        padding: EdgeInsets.all(24.scale),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22.scale),
            ),
            SizedBox(height: 8.scale),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.scale),
            SizedBox(
              width: double.infinity,
              child: ImobButton(
                text: 'Ok',
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
