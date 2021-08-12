import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/register_pipeline_usecase.dart';
import 'domain/usecases/register_with_phone_and_name_usecase.dart';
import 'presentation/controller/register_controller.dart';
import 'presentation/pages/register_page.dart';

class RegisterModule extends Module {
  static String get routeName => '/register';

  @override
  List<Bind> get binds => [
        // --------------------- CONTROLLERS ----------------------
        Bind((i) => RegisterController(
              onRegisterSucessUseCase: i(),
              registerPipelineUseCase: i(),
            )),
        // ---------------------- USE CASES -----------------------
        Bind((i) => RegisterPipelineUseCase(
              verifyUserExistWithPhoneNumberUseCase: i(),
              registerWithPhoneNumberAndNameUseCase: i(),
            )),

        Bind((i) => RegisterWithPhoneNumberAndNameUseCase(
              authRepository: i(),
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
      child: (_, args) => RegisterPage(),
    ),
  ];
}
