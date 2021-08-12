import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:imob_core/imob_core.dart';

abstract class IOnRegisterSucessUseCase
    implements UseCase<void, ParamsOnRegisterSucessUseCase> {
  @override
  Future<Either<IFailure, void>> call(
    ParamsOnRegisterSucessUseCase params,
  );
}

class ParamsOnRegisterSucessUseCase {
  final User user;

  ParamsOnRegisterSucessUseCase({
    required this.user,
  });
}
