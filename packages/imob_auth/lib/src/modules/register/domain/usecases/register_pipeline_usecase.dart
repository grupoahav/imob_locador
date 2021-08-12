import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:imob_core/imob_core.dart';

import '../../../../core/domain/usecases/verify_exist_user_with_phone_number_usecase.dart';
import 'register_with_phone_and_name_usecase.dart';

class RegisterPipelineUseCase
    implements
        UseCase<ResultRegisterPipelineUseCase, ParamsRegisterPipelineUseCase> {
  final VerifyUserExistWithPhoneNumberUseCase
      _verifyUserExistWithPhoneNumberUseCase;
  final RegisterWithPhoneNumberAndNameUseCase
      _registerWithPhoneNumberAndNameUseCase;

  RegisterPipelineUseCase({
    required VerifyUserExistWithPhoneNumberUseCase
        verifyUserExistWithPhoneNumberUseCase,
    required RegisterWithPhoneNumberAndNameUseCase
        registerWithPhoneNumberAndNameUseCase,
  })  : _verifyUserExistWithPhoneNumberUseCase =
            verifyUserExistWithPhoneNumberUseCase,
        _registerWithPhoneNumberAndNameUseCase =
            registerWithPhoneNumberAndNameUseCase;

  @override
  Future<Either<IFailure, ResultRegisterPipelineUseCase>> call(
    ParamsRegisterPipelineUseCase params,
  ) async {
    try {
      await _verifyUserNotExistWithPhoneNumber(phoneNumber: params.phoneNumber);

      final User user = await _registerWithPhoneNumberAndName(
        fullName: params.fullName,
        phoneNumber: params.phoneNumber,
      );

      return Right(
        ResultRegisterPipelineUseCase(
          user: user,
        ),
      );
    } on IFailure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(InternalFailure());
    }
  }

  Future<bool> _verifyUserNotExistWithPhoneNumber({
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
        return false;
        // TODO: Alterar depois que o endpoint for integrado
        // if (hasUser)
        //   throw const Failure(
        //     message: 'Esse número já foi cadastrado! Tente um outro número',
        //   );

        // return hasUser;
      },
    );
  }

  Future<User> _registerWithPhoneNumberAndName({
    required String phoneNumber,
    required String fullName,
  }) async {
    final failureOrUser = await _registerWithPhoneNumberAndNameUseCase(
      ParamsRegisterWithPhoneNumberAndNameUseCase(
        phoneNumber: phoneNumber,
        fullName: fullName,
      ),
    );

    return failureOrUser.fold(
      (failure) => throw failure,
      (user) => user,
    );
  }
}

class ParamsRegisterPipelineUseCase {
  final String phoneNumber;
  final String fullName;

  ParamsRegisterPipelineUseCase({
    required this.phoneNumber,
    required this.fullName,
  });
}

class ResultRegisterPipelineUseCase {
  final User user;

  ResultRegisterPipelineUseCase({
    required this.user,
  });
}
