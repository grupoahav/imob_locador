import 'package:firebase_auth/firebase_auth.dart';
import 'package:imob_core/imob_core.dart';

import '../../../../core/domain/repositories/i_auth_repository.dart';
import '../../../../core/domain/usecases/verify_phone_number_usecase.dart';

class RegisterWithPhoneNumberAndNameUseCase
    implements UseCase<User, ParamsRegisterWithPhoneNumberAndNameUseCase> {
  final VerifyPhoneNumberUseCase _verifyPhoneNumberUseCase;
  final IAuthRepository _authRepository;

  RegisterWithPhoneNumberAndNameUseCase({
    required VerifyPhoneNumberUseCase verifyPhoneNumberUseCase,
    required IAuthRepository authRepository,
  })  : _verifyPhoneNumberUseCase = verifyPhoneNumberUseCase,
        _authRepository = authRepository;

  @override
  Future<Either<IFailure, User>> call(params) async {
    try {
      final User user = await verifyPhoneNumberUseCase(
        phoneNumber: params.phoneNumber,
      );

      await saveRemoteFullNameAndPhoneNumber(
        fullName: params.fullName,
        phoneNumber: params.phoneNumber,
      );

      return Right(user);
    } on IFailure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(InternalFailure());
    }
  }

  Future<User> verifyPhoneNumberUseCase({
    required String phoneNumber,
  }) async {
    final failureOrUser = await _verifyPhoneNumberUseCase(
        ParamsVerifyPhoneNumberUseCase(phoneNumber: phoneNumber));

    return failureOrUser.fold(
      (failure) => throw failure,
      (user) => user,
    );
  }

  Future<void> saveRemoteFullNameAndPhoneNumber({
    required String fullName,
    required String phoneNumber,
  }) async {
    final failureOrSucess =
        await _authRepository.saveRemoteFullNameAndPhoneNumber(
      fullName: fullName,
      phoneNumber: phoneNumber,
    );

    return failureOrSucess.fold(
      (failure) => throw failure,
      (sucess) => sucess,
    );
  }
}

class ParamsRegisterWithPhoneNumberAndNameUseCase {
  final String phoneNumber;
  final String fullName;

  ParamsRegisterWithPhoneNumberAndNameUseCase({
    required this.phoneNumber,
    required this.fullName,
  });
}
