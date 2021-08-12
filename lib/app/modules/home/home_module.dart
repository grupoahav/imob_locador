import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  static String get routeName => '/home';
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
      child: (_, args) => HomePage(),
    ),
  ];
}
