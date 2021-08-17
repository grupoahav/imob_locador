import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controllers/bottom_navigation_controller.dart';
import 'presentation/pages/bottom_navigation_page.dart';

class BottonNavigationModule extends Module {
  static String get routeName => '/bottomNavigation';
  static String get routeInitial => routeName;

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => BottomNavigationController()),
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => BottomNavigationPage(),
    ),
  ];
}
