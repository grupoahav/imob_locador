import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/data/datasources/auth_firebase_datasource.dart';
import 'core/data/datasources/i_auth_remote_datasource.dart';
import 'core/data/repositories/auth_repository.dart';
import 'core/domain/repositories/i_auth_repository.dart';
import 'core/domain/usecases/logout_auth_usecase.dart';
import 'core/domain/usecases/verify_exist_user_with_phone_number_usecase.dart';
import 'core/domain/usecases/verify_phone_number_usecase.dart';
import 'core/stores/auth_store.dart';
import 'modules/boas_vindas/boas_vindas_module.dart';
import 'modules/confirm_code/confirm_code_module.dart';
import 'modules/login/login_module.dart';
import 'modules/register/register_module.dart';

class ImobAuthModule extends Module {
  static String get routeName => '/auth';
  static String get routeInitial => routeName + BoasVindasModule.routeName;

  @override
  final List<Bind> binds = [
    // ----------------------- STORES -------------------------
    Bind((i) => AuthStore(), export: true),

    // ---------------------- USE CASES -----------------------
    Bind(
      (i) => LogoutAuthUseCase(authRepository: i()),
      export: true,
    ),
    Bind((i) => VerifyUserExistWithPhoneNumberUseCase(
          authRepository: i(),
        )),
    Bind((i) => VerifyPhoneNumberUseCase()),
    // --------------------- REPOSITORIES ---------------------
    Bind<IAuthRepository>(
      (i) => AuthRepository(
        networkInfo: i(),
        remoteDataSource: i(),
      ),
      export: true,
    ),

    // --------------------- DATA SOURCES ---------------------
    Bind<IAuthRemoteDataSource>(
      (i) => AuthFirebaseDatasource(
        firebaseAuth: i(),
        collectionUsers: i(),
      ),
      export: true,
    ),

    // ------------------------ SERVICES ------------------------
    Bind<FirebaseAuth>(
      (i) => FirebaseAuth.instance,
      export: true,
    ),
    Bind<CollectionReference>(
      (i) => FirebaseFirestore.instance.collection('users'),
      export: true,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      BoasVindasModule.routeName,
      module: BoasVindasModule(),
    ),
    ModuleRoute(
      LoginModule.routeName,
      module: LoginModule(),
    ),
    ModuleRoute(
      RegisterModule.routeName,
      module: RegisterModule(),
    ),
    ModuleRoute(
      ConfirmCodeModule.routeName,
      module: ConfirmCodeModule(),
    )
  ];
}
