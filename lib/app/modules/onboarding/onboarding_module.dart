import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controllers/onboarding_controller.dart';
import 'presentation/pages/onboarding_page.dart';

class ImobOnboardingModule extends Module {
  static String get routeName => '/onboarding';
  static String get routeInitial => routeName;

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => OnboardingController()),
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ----------------------- SERVICES -----------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => OnboardingPage(),
    ),
  ];
}
