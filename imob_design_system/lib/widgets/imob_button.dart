import 'package:flutter/material.dart';
import 'package:imob_design_system/colors/colors.dart';

enum ImobButtonType { primary, secondary }

class ImobButton extends StatelessWidget {
  const ImobButton({
    Key? key,
    required this.onPressed,
    this.type = ImobButtonType.primary,
    required this.text,
    this.expanded = false,
  }) : super(key: key);

  final Function() onPressed;
  final ImobButtonType type;
  final String text;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        child: InkWell(
          onTap: onPressed,
          child: Row(
            children: [
              ConditionalExpanded(
                expanded: expanded,
                child: Container(
                  decoration: BoxDecoration(
                      color: type == ImobButtonType.primary
                          ? ImobColors.primaryColor
                          : ImobColors.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 3, color: ImobColors.primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: type == ImobButtonType.primary
                            ? ImobColors.secondaryColor
                            : ImobColors.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConditionalExpanded extends StatelessWidget {
  const ConditionalExpanded({Key? key, required this.expanded, required this.child}) : super(key: key);

  final bool expanded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return expanded ? Expanded(child: child) : child;
  }
}

