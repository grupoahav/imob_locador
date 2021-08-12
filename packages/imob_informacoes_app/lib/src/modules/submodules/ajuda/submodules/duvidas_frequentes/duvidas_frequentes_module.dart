import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/duvidas_frequentes_page.dart';

class DuvidasFrequentesModule extends Module {
  static String get routeName => '/duvidasFrequentes';
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
      child: (_, args) => DuvidasFrequentesPage(),
    ),
  ];
}
