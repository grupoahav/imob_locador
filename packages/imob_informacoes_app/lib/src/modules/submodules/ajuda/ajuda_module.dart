import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/ajuda_page.dart';
import 'submodules/duvidas_frequentes/duvidas_frequentes_module.dart';
import 'submodules/enviar_pergunta/enviar_pergunta_module.dart';

class AjudaModule extends Module {
  static String get routeName => '/ajuda';
  static String get routeInitial => routeName;

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => AjudaPage(),
    ),
    ModuleRoute(
      DuvidasFrequentesModule.routeName,
      module: DuvidasFrequentesModule(),
    ),
    ModuleRoute(
      EnviarPerguntaModule.routeName,
      module: EnviarPerguntaModule(),
    )
  ];
}
