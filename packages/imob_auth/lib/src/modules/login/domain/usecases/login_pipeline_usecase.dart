import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:imob_core/imob_core.dart';

import '../../../../core/domain/usecases/verify_exist_user_with_phone_number_usecase.dart';
import 'sign_in_with_phonenumber_usecase.dart';

class LoginPipelineUseCase
    implements UseCase<ResultLoginPipelineUseCase, ParamsLoginPipelineUseCase> {
  final VerifyUserExistWithPhoneNumberUseCase
      _verifyUserExistWithPhoneNumberUseCase;
  final SignInWithPhoneNumberUseCase _signInWithPhoneNumberUseCase;

  LoginPipelineUseCase({
    required VerifyUserExistWithPhoneNumberUseCase
        verifyUserExistWithPhoneNumberUseCase,
    required SignInWithPhoneNumberUseCase signInWithPhoneNumberUseCase,
  })  : _verifyUserExistWithPhoneNumberUseCase =
            verifyUserExistWithPhoneNumberUseCase,
        _signInWithPhoneNumberUseCase = signInWithPhoneNumberUseCase;

  @override
  Future<Either<IFailure, ResultLoginPipelineUseCase>> call(
    ParamsLoginPipelineUseCase params,
  ) async {
    try {
      await _verifyUserExistWithPhoneNumber(phoneNumber: params.phoneNumber);

      final User user =
          await _signInWithPhoneNumber(phoneNumber: params.phoneNumber);

      return Right(
        ResultLoginPipelineUseCase(
          user: user,
        ),
      );
    } on IFailure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(InternalFailure());
    }
  }

  Future<bool> _verifyUserExistWithPhoneNumber({
    required String phoneNumber,
  }) async {
    final failureOrUser = await _verifyUserExistWithPhoneNumberUseCase(
      ParamsVerifyUserExistWithPhoneNumberUseCase(
        phoneNumber: phoneNumber,
      ),
    );

    return failureOrUser.fold(
      (failure) => throw failure,
      (hasUser) {
        if (!hasUser) throw const Failure(message: 'Usuário não encontrado');

        return hasUser;
      },
    );
  }

  Future<User> _signInWithPhoneNumber({
    required String phoneNumber,
  }) async {
    final failureOrUser = await _signInWithPhoneNumberUseCase(
      ParamsSignInWithPhoneNumberUseCase(
        phoneNumber: phoneNumber,
      ),
    );

    return failureOrUser.fold(
      (failure) => throw failure,
      (user) => user,
    );
  }
}

class ParamsLoginPipelineUseCase {
  final String phoneNumber;

  ParamsLoginPipelineUseCase({
    required this.phoneNumber,
  });
}

class ResultLoginPipelineUseCase {
  final User user;

  ResultLoginPipelineUseCase({
    required this.user,
  });
}
