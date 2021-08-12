import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/termos_de_servicos_page.dart';

class TermosServicosModule extends Module {
  static String get routeName => '/termosServicos';
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
      child: (_, args) => TermosServicosPage(),
    ),
  ];
}
