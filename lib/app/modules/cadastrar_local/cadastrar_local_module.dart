import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controllers/cadastrar_local_controller.dart';
import 'presentation/pages/cadastrar_local_page.dart';
import 'submodules/dados_proprietario/dados_proprietario_module.dart';

class CadastrarLocalModule extends WidgetModule {
  static String get routeName => '/cadastrarLocal';
  static String get routeInitial => routeName;

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => CadastrarLocalController()),
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => CadastrarLocalPage(),
    ),
    ModuleRoute(
      DadosProprietarioModule.routeName,
      module: DadosProprietarioModule(),
    ),
  ];

  @override
  Widget get view => CadastrarLocalPage();
}
