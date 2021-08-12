import 'package:flutter_modular/flutter_modular.dart';

import '../submodules/ajuda/ajuda_module.dart';
import '../submodules/termos_de_servicos/termos_de_servicos_module.dart';
import 'presentation/pages/informacoes_app_page.dart';

class ImobInformacoesAppModule extends Module {
  static String get routeName => '/auth';
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
      child: (_, args) => InformacoesAppPage(),
    ),
    ModuleRoute(
      TermosServicosModule.routeName,
      module: TermosServicosModule(),
    ),
    ModuleRoute(
      AjudaModule.routeName,
      module: AjudaModule(),
    ),
  ];
}
