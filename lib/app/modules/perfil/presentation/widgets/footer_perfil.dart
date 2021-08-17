import 'package:flutter/material.dart';
import 'package:imob_informacoes_app/imob_informacoes_app.dart';

class FooterPerfil extends StatelessWidget {
  const FooterPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.lock,
              color: theme.textTheme.bodyText2!.color,
            ),
            label: Text(
              'Políticas de privacidade',
              style: theme.textTheme.caption,
            ),
          ),
          const ButtonInformacoesApp(),
        ],
      ),
    );
  }
}
