import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/login_pipeline_usecase.dart';
import 'domain/usecases/sign_in_with_phonenumber_usecase.dart';
import 'presentation/controller/login_controller.dart';
import 'presentation/pages/login_page.dart';

class LoginModule extends Module {
  static String get routeName => '/login';

  @override
  List<Bind> get binds => [
        // --------------------- CONTROLLERS ----------------------
        Bind((i) => LoginController(
              loginSucessUseCase: i(),
              loginUseCase: i(),
            )),
        // ---------------------- USE CASES -----------------------
        Bind((i) => LoginPipelineUseCase(
              verifyUserExistWithPhoneNumberUseCase: i(),
              signInWithPhoneNumberUseCase: i(),
            )),
        Bind((i) => SignInWithPhoneNumberUseCase(
              verifyPhoneNumberUseCase: i(),
            )),

        // --------------------- REPOSITORIES ---------------------
        // --------------------- DATA SOURCES ---------------------
        // ------------------------ OTHERS ------------------------
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => LoginPage(),
    ),
  ];
}
