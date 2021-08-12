import 'dart:async';

import 'package:imob_auth/imob_auth.dart';
import 'package:imob_core/imob_core.dart';

class OnRegisterSucessUseCase implements IOnRegisterSucessUseCase {
  @override
  Future<Either<IFailure, void>> call(
    ParamsOnRegisterSucessUseCase params,
  ) async {
    try {
      // Modular.to.navigate(
      //   BottomNavigationModule.routeName,
      // );
      return Right(voidRight);
    } on IFailure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(InternalFailure());
    }
  }
}
