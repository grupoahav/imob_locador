import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imob_design_system/imob_design_system.dart';

class EnviarPerguntaPage extends StatefulWidget {
  @override
  _EnviarPerguntaPageState createState() => _EnviarPerguntaPageState();
}

class _EnviarPerguntaPageState extends State<EnviarPerguntaPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor,
        statusBarIconBrightness: theme.brightness.opposite,
        statusBarBrightness: theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: ImobBackButton(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.scale,
                  horizontal: 24.scale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enviar pergunta',
                      style: theme.textTheme.headline5!.merge(
                        TextStyle(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.scale),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o Nome';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o Sobrenome';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Sobrenome',
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o E-mail';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o Telefone';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Telefone',
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o Título da pergunta';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Título da pergunta',
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    SizedBox(
                      height: 180.scale,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira o Descrição';
                          }
                        },
                        maxLines: 180.scale ~/ 10,
                        decoration: const InputDecoration(
                          labelText: 'Descrição',
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                    const InfoSucessOrSizedBox(isSucess: true),
                    ImobButton(
                      text: 'Enviar',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoSucessOrSizedBox extends StatelessWidget {
  const InfoSucessOrSizedBox({
    Key? key,
    required this.isSucess,
  }) : super(key: key);

  final bool isSucess;

  @override
  Widget build(BuildContext context) {
    if (isSucess) SizedBox(height: 32.scale);

    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(height: 16.scale),
        Container(
          padding: EdgeInsets.all(16.scale),
          decoration: BoxDecoration(
            color: ImobColors.greenLight,
            borderRadius: BorderRadius.circular(12.scale),
          ),
          child: Text(
            'Parabéns! Sua pergunta foi enviada e em breve será respondida por um de nossos consultores.',
            style: TextStyle(color: theme.colorScheme.onPrimary),
          ),
        ),
        SizedBox(height: 16.scale),
      ],
    );
  }
}
