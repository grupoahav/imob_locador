import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../utils/extensions/screen_extension.dart';

class ImobBackButton extends StatelessWidget {
  const ImobBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    final bool canPop = parentRoute?.canPop ?? false;

    if (!canPop) return const SizedBox.shrink();

    return TextButton.icon(
      icon: Icon(
        Icons.arrow_back_outlined,
        color: theme.textTheme.bodyText2!.color,
      ),
      label: Padding(
        padding: EdgeInsets.only(top: 2.5.scale),
        child: Text(
          'Voltar',
          style: theme.textTheme.button!.merge(
            TextStyle(
              fontSize: 16.scale,
              fontWeight: FontWeight.w600,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: () {
        Modular.to.pop();
      },
    );
  }
}
