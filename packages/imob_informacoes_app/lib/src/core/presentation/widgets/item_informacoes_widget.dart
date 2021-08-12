import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class ItemInformacoes extends StatelessWidget {
  const ItemInformacoes({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(16.scale),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              child,
              if (onPressed != null)
                Icon(
                  Icons.arrow_right,
                  color: theme.textTheme.bodyText2!.color,
                )
              else
                SizedBox(
                  height: IconTheme.of(context).size,
                )
            ],
          ),
        ),
      ),
    );
  }
}
