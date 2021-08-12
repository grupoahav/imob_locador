import 'package:flutter_modular/flutter_modular.dart';

import 'domain/arguments_confirm_sms_code_entity.dart';
import 'presentation/controller/confirm_code_controller.dart';
import 'presentation/pages/confirm_code_page.dart';

class ConfirmCodeModule extends Module {
  static String get routeName => '/confirmCode';
  static String get initialRoute => routeName;

  @override
  List<Bind> get binds => [
        // --------------------- CONTROLLERS ----------------------
        Bind(
          (i) => ConfirmCodeController(
            verificationId:
                (i.args?.data as ArgumentsConfirmSmsCode).verificationId,
            onConfirmSmsCode:
                (i.args?.data as ArgumentsConfirmSmsCode).onConfirmSmsCode,
          ),
        ),
        // ---------------------- USE CASES -----------------------
        // --------------------- REPOSITORIES ---------------------
        // --------------------- DATA SOURCES ---------------------
        // ------------------------ OTHERS ------------------------
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => ConfirmCodePage(),
    ),
  ];
}
