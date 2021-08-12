import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controller/boas_vindas_controller.dart';
import 'presentation/pages/boas_vindas_page.dart';

class BoasVindasModule extends Module {
  static String get routeName => '/boasVindas';

  @override
  List<Bind> get binds => [
        // --------------------- CONTROLLERS ----------------------
        Bind((i) => BoasVindasController()),
        // ---------------------- USE CASES -----------------------
        // --------------------- REPOSITORIES ---------------------
        // --------------------- DATA SOURCES ---------------------
        // ------------------------ OTHERS ------------------------
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const BoasVindasPage(),
    ),
  ];
}
