import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class ItemInformacoesExpandible extends StatelessWidget {
  const ItemInformacoesExpandible({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ExpansionTile(
      title: Text(
        title,
        style: theme.textTheme.bodyText2,
      ),
      iconColor: theme.colorScheme.error,
      childrenPadding: EdgeInsets.all(16.scale),
      children: [Text(content)],
    );
  }
}
