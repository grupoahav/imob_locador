import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_auth/imob_auth.dart';
import 'package:imob_core/imob_core.dart';

import '../../../onboarding/onboarding_module.dart';

class OnLoginSucessUseCase implements IOnLoginSucessUseCase {
  @override
  Future<Either<IFailure, void>> call(
    ParamsOnLoginSucessUseCase params,
  ) async {
    try {
      Modular.to.navigate(ImobOnboardingModule.routeInitial);
      return Right(voidRight);
    } on IFailure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(InternalFailure());
    }
  }
}
