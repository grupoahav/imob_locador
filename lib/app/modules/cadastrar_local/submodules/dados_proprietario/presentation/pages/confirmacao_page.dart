import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../../dados_proprietario_module.dart';

class ConfirmacaoPage extends StatefulWidget {
  @override
  _ConfirmacaoPageState createState() => _ConfirmacaoPageState();
}

class _ConfirmacaoPageState extends State<ConfirmacaoPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dados do Proprietário'),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              padding: EdgeInsets.only(
                top: 24.scale,
                left: 24.scale,
                right: 24.scale,
                bottom: (24 + theme.buttonTheme.height + 24).scale,
              ),
              children: [
                Column(
                  children: [
                    Text(
                      'Confirmação',
                      style: theme.textTheme.headline6!.merge(
                        TextStyle(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.scale),
                    Text(
                      'Confirme os dados informados e prossiga',
                    )
                  ],
                ),
                SizedBox(height: 24.scale),
                SectionConfirm(
                  titleSection: 'Dados Pessoais',
                  onTapEditar: () {},
                  items: const [
                    _ItemText(
                      label: 'Nome Completo do Proprietário',
                      text: 'Benedito Vieira da Silva',
                    ),
                    _ItemText(
                      label: 'CPF',
                      text: '026.699.658-10',
                    ),
                    _ItemText(
                      label: 'Identidade',
                      text: '24525234 SSP MG',
                    ),
                    _ItemText(
                      label: 'Nome Completo do Representante',
                      text: 'André Luiz Vieira da Silva',
                    ),
                    _ItemText(
                      label: 'CPF',
                      text: '026.699.658-10',
                    ),
                    _ItemText(
                      label: 'Identidade',
                      text: '24525234 SSP MG',
                    ),
                  ],
                ),
                SizedBox(height: 24.scale),
                SectionConfirm(
                  titleSection: 'Endereços',
                  onTapEditar: () {},
                  items: const [
                    _ItemText(
                      label: 'Endereço Proprietário',
                      text:
                          'Avenida Independência, 1230, Qd. 10 Lt. 2-A, Setor dos Funcionários - Goiânia - GO - CEP: 74589-690',
                    ),
                    _ItemText(
                      label: 'Endereço do Representante',
                      text:
                          'Avenida Independência, 1230, Qd. 10 Lt. 2-A, Setor dos Funcionários - Goiânia - GO - CEP: 74589-690',
                    ),
                  ],
                ),
                SizedBox(height: 24.scale),
                SectionConfirm(
                  titleSection: 'Contatos',
                  onTapEditar: () {},
                  items: const [
                    _ItemText(
                      label: 'Endereço de E-mail',
                      text: 'beneditovieira@gmail.com',
                    ),
                    _ItemText(
                      label: 'Telefone Residencial',
                      text: '(62) 3655-5600',
                    ),
                    _ItemText(
                      label: 'Telefone Celular',
                      text: '(62) 98576-5501',
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24.0.scale),
              child: ImobButton.secondary(
                text: 'Confirmar e Prosseguir',
                onPressed: () {
                  Modular.to.popUntil(
                    ModalRoute.withName(
                      '/cadastrarLocal/',
                    ),
                  );
                  // Modular.to.pushNamed(
                  //   DadosProprietarioModule.routeToContatos,
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionConfirm extends StatelessWidget {
  const SectionConfirm({
    Key? key,
    required this.titleSection,
    required this.onTapEditar,
    required this.items,
  }) : super(key: key);

  final String titleSection;
  final VoidCallback onTapEditar;
  final List<_ItemText> items;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleSection,
              style: theme.textTheme.subtitle1!.merge(
                TextStyle(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            TextButton(
              onPressed: onTapEditar,
              child: const Text(
                'Editar',
                style: TextStyle(
                  color: ImobColors.red,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 16.scale),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 24.scale,
          spacing: 16.scale,
          children: items,
        )
      ],
    );
  }
}

class _ItemText extends StatelessWidget {
  const _ItemText({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
