import 'package:firebase_auth/firebase_auth.dart';
import 'package:imob_core/imob_core.dart';

import '../../../../core/domain/usecases/verify_phone_number_usecase.dart';

class SignInWithPhoneNumberUseCase
    implements UseCase<User, ParamsSignInWithPhoneNumberUseCase> {
  final VerifyPhoneNumberUseCase _verifyPhoneNumberUseCase;

  SignInWithPhoneNumberUseCase({
    required VerifyPhoneNumberUseCase verifyPhoneNumberUseCase,
  }) : _verifyPhoneNumberUseCase = verifyPhoneNumberUseCase;

  @override
  Future<Either<IFailure, User>> call(params) async {
    try {
      final User user = await _verifyPhoneNumber(
        phoneNumber: params.phoneNumber,
      );

      return Right(user);
    } on IFailure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(InternalFailure());
    }
  }

  Future<User> _verifyPhoneNumber({
    required String phoneNumber,
  }) async {
    final failureOrUser = await _verifyPhoneNumberUseCase(
        ParamsVerifyPhoneNumberUseCase(phoneNumber: phoneNumber));

    return failureOrUser.fold(
      (failure) => throw failure,
      (user) => user,
    );
  }
}

class ParamsSignInWithPhoneNumberUseCase {
  final String phoneNumber;

  ParamsSignInWithPhoneNumberUseCase({
    required this.phoneNumber,
  });
}
