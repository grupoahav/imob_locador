import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../modules/imob_informacoes_app/imob_informacoes_app_module.dart';

class ButtonInformacoesApp extends StatelessWidget {
  const ButtonInformacoesApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextButton.icon(
      onPressed: () {
        Modular.to.pushNamed(ImobInformacoesAppModule.routeInitial);
      },
      icon: Icon(
        Icons.info_outline,
        color: theme.textTheme.bodyText2!.color,
      ),
      label: Text(
        'Informações sobre o APP',
        style: theme.textTheme.caption,
      ),
    );
  }
}
