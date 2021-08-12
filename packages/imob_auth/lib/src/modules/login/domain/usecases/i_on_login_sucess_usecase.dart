import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:imob_core/imob_core.dart';

abstract class IOnLoginSucessUseCase
    implements UseCase<void, ParamsOnLoginSucessUseCase> {
  @override
  Future<Either<IFailure, void>> call(
    ParamsOnLoginSucessUseCase params,
  );
}

class ParamsOnLoginSucessUseCase {
  final User? user;

  ParamsOnLoginSucessUseCase({
    this.user,
  });
}
