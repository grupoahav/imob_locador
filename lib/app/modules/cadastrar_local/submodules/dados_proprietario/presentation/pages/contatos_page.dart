import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:imob_locador/app/modules/cadastrar_local/submodules/dados_proprietario/dados_proprietario_module.dart';

import '../../../../domain/enums/registration_progress_enum.dart';
import '../../../../presentation/widgets/imob_line_stepper_widget.dart';
import '../../../../presentation/widgets/imob_step_widget.dart';

class ContatosPage extends StatefulWidget {
  @override
  _ContatosPageState createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.scale),
                  child: Row(
                    children: [
                      const ImobStep(
                          progress: EnumRegistrationProgress.complete),
                      Expanded(
                        child: ImobLineStep(
                          color: EnumRegistrationProgress.complete.color,
                          isHorizontal: true,
                        ),
                      ),
                      const ImobStep(
                        progress: EnumRegistrationProgress.complete,
                      ),
                      Expanded(
                        child: ImobLineStep(
                          color: EnumRegistrationProgress.complete.color,
                          isHorizontal: true,
                        ),
                      ),
                      const ImobStep(
                          progress: EnumRegistrationProgress.complete),
                    ],
                  ),
                ),
                SizedBox(height: 16.scale),
                DefaultTextStyle(
                  style: theme.textTheme.caption!,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dados\nPessoais',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Endereços',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Contatos',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.scale),
                Text(
                  'Contatos do Proprietário',
                  style: theme.textTheme.subtitle1,
                ),
                SizedBox(height: 16.scale),
                Text(
                  'Endereço de E-mail',
                  style: theme.textTheme.caption,
                ),
                SizedBox(height: 8.scale),
                TextFormField(),
                SizedBox(height: 16.scale),
                Text(
                  'Telefone Fixo',
                  style: theme.textTheme.caption,
                ),
                SizedBox(height: 8.scale),
                TextFormField(),
                SizedBox(height: 16.scale),
                Text(
                  'Telefone Celular',
                  style: theme.textTheme.caption,
                ),
                SizedBox(height: 8.scale),
                TextFormField(),
                SizedBox(height: 16.scale),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cidade',
                            style: theme.textTheme.caption,
                          ),
                          SizedBox(height: 8.scale),
                          TextFormField(),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.scale),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estado',
                            style: theme.textTheme.caption,
                          ),
                          SizedBox(height: 8.scale),
                          TextFormField(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.scale),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Número',
                            style: theme.textTheme.caption,
                          ),
                          SizedBox(height: 8.scale),
                          TextFormField(),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.scale),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Complemento',
                            style: theme.textTheme.caption,
                          ),
                          SizedBox(height: 8.scale),
                          TextFormField(),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24.0.scale),
              child: ImobButton(
                text: 'Prosseguir',
                onPressed: () {
                  Modular.to.pushNamed(
                    DadosProprietarioModule.routeToConfirmacao,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
