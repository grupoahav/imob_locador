import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../../../../core/presentation/widgets/item_informacoes_widget.dart';
import '../../../submodules/ajuda/ajuda_module.dart';
import '../../../submodules/termos_de_servicos/termos_de_servicos_module.dart';

class InformacoesAppPage extends StatefulWidget {
  @override
  _InformacoesAppPageState createState() => _InformacoesAppPageState();
}

class _InformacoesAppPageState extends State<InformacoesAppPage> {
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
                      'Informações',
                      style: theme.textTheme.headline5!.merge(
                        TextStyle(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    Divider(height: 2.scale, thickness: 2.scale),
                    ItemInformacoes(
                      child: const Text('Termos de serviços'),
                      onPressed: () {
                        Modular.to.pushNamed(
                          '.${TermosServicosModule.routeInitial}',
                        );
                      },
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                    ItemInformacoes(
                      child: const Text('Ajuda'),
                      onPressed: () {
                        Modular.to.pushNamed(
                          '.${AjudaModule.routeInitial}',
                        );
                      },
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                    ItemInformacoes(
                      child: const Text('Como funciona'),
                      onPressed: () {},
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                    const ItemInformacoes(
                      child: Text('Versao 1.0'),
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                    ItemInformacoes(
                      child: Row(
                        children: const [
                          Text('Vídeo'),
                        ],
                      ),
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
