import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../../../../../core/presentation/widgets/item_informacoes_widget.dart';
import '../../submodules/duvidas_frequentes/duvidas_frequentes_module.dart';
import '../../submodules/enviar_pergunta/enviar_pergunta_module.dart';

class AjudaPage extends StatefulWidget {
  @override
  _AjudaPageState createState() => _AjudaPageState();
}

class _AjudaPageState extends State<AjudaPage> {
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImobBackButton(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.scale,
                  horizontal: 24.scale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ajuda',
                      style: theme.textTheme.headline5!.merge(
                        TextStyle(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    Divider(height: 2.scale, thickness: 2.scale),
                    ItemInformacoes(
                      child: const Text('Dúvidas frequentes'),
                      onPressed: () {
                        Modular.to.pushNamed(
                          '.${DuvidasFrequentesModule.routeInitial}',
                        );
                      },
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                    ItemInformacoes(
                      child: const Text('Enviar pergunta'),
                      onPressed: () {
                        Modular.to.pushNamed(
                          '.${EnviarPerguntaModule.routeInitial}',
                        );
                      },
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                    ItemInformacoes(
                      child: const Text('Fale com a gente'),
                      onPressed: () {},
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
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
