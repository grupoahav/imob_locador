import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_auth/imob_auth.dart';
import 'package:imob_core/imob_core.dart';
import 'package:imob_informacoes_app/imob_informacoes_app.dart';

import 'app_controller.dart';
import 'modules/bottom_navigation/bottom_navigation_module.dart';
import 'modules/cadastrar_local/cadastrar_local_module.dart';
import 'modules/login/domain/usecases/on_login_sucess_usecase.dart';
import 'modules/login/domain/usecases/on_register_sucess_usecase.dart';
import 'modules/onboarding/onboarding_module.dart';

class AppModule extends Module {
  static String get initialRoute => FirebaseAuth.instance.currentUser == null
      ? ImobAuthModule.routeInitial
      : BottonNavigationModule.routeInitial;

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    Bind(
      (i) => AppController(
        networkInfo: i(),
      ),
      isLazy: false,
    ),
    // ---------------------- USE CASES -----------------------
    // -----> Login
    Bind((i) => OnLoginSucessUseCase()),
    // -----> Register
    Bind((i) => OnRegisterSucessUseCase()),
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ----------------------- SERVICES -----------------------
    Bind((i) => Dio()),
    Bind<INetworkInfo>((i) => NetworkInfo()),
    // -------------------- NOTIFICATIONS ---------------------
  ];

  @override
  final List<Module> imports = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      ImobAuthModule.routeName,
      module: ImobAuthModule(),
    ),
    ModuleRoute(
      ImobInformacoesAppModule.routeName,
      module: ImobInformacoesAppModule(),
    ),
    ModuleRoute(
      ImobOnboardingModule.routeName,
      module: ImobOnboardingModule(),
    ),
    ModuleRoute(
      BottonNavigationModule.routeName,
      module: BottonNavigationModule(),
    ),
    ModuleRoute(
      CadastrarLocalModule.routeName,
      module: CadastrarLocalModule(),
    ),
  ];
}
