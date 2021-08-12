import 'package:flutter/material.dart';

import '../utils/extensions/screen_extension.dart';

enum ImobButtonType { primary, secondary }

class ImobButton extends StatelessWidget {
  const ImobButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.isLoading = false,
  })  : type = ImobButtonType.primary,
        super(key: key);

  const ImobButton.secondary({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.isLoading = false,
  })  : type = ImobButtonType.secondary,
        super(key: key);

  final Function()? onPressed;
  final ImobButtonType type;
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final Color colorPrimaryOrSecondary = type == ImobButtonType.primary
        ? theme.colorScheme.primary
        : theme.colorScheme.secondary;
    final Color onColorPrimaryOrSecondary = type == ImobButtonType.primary
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSecondary;

    late Color textColor;
    late Color overlayColor;
    if (backgroundColor != null) {
      final double backgroundColorLuminace =
          backgroundColor!.computeLuminance();
      if (backgroundColorLuminace > 0.5) {
        textColor = this.textColor ??
            (type == ImobButtonType.primary
                ? theme.colorScheme.primary
                : theme.colorScheme.secondary);
        overlayColor = colorPrimaryOrSecondary.withOpacity(0.2);
      } else {
        textColor = this.textColor ??
            (type == ImobButtonType.primary
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSecondary);
        overlayColor = onColorPrimaryOrSecondary.withOpacity(0.2);
      }
    } else {
      textColor = type == ImobButtonType.primary
          ? theme.colorScheme.onPrimary
          : theme.colorScheme.onSecondary;

      overlayColor = onColorPrimaryOrSecondary.withOpacity(0.2);
    }

    return Container(
      constraints: BoxConstraints(
        minHeight: height ?? 48.scale,
        minWidth: width ?? 160.scale,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: onColorPrimaryOrSecondary,
              ))
            : Padding(
                padding: EdgeInsets.all(8.0.scale),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: theme.textTheme.button!.merge(
                          TextStyle(
                            color: textColor,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return theme.disabledColor;
              }

              return backgroundColor ?? colorPrimaryOrSecondary;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return onColorPrimaryOrSecondary;
              }

              return onColorPrimaryOrSecondary;
            },
          ),
          overlayColor: MaterialStateProperty.all(overlayColor),
          shape: MaterialStateProperty.all<OutlinedBorder?>(
            RoundedRectangleBorder(
              side: borderColor != null
                  ? BorderSide(
                      color: borderColor!,
                      width: 3.scale,
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(10.scale),
            ),
          ),
        ),
        // style: TextButton.styleFrom(
        //   backgroundColor: onPressed != null
        //       ? backgroundColor ?? Theme.of(context).primaryColor
        //       : Theme.of(context).disabledColor,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //     side: BorderSide(
        //       width: 3.scale,
        //       color: type == ImobButtonType.primary
        //           ? borderColor ?? theme.colorScheme.primary
        //           : borderColor ?? theme.colorScheme.secondary,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
