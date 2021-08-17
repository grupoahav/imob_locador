import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/perfil_page.dart';

class PerfilModule extends WidgetModule {
  static String get routeName => '/perfil';
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
      child: (_, args) => PerfilPage(),
    ),
  ];

  @override
  Widget get view => PerfilPage();
}
