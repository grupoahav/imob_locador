import 'package:imob_core/imob_core.dart';

import '../repositories/i_auth_repository.dart';

class VerifyUserExistWithPhoneNumberUseCase
    implements UseCase<void, ParamsVerifyUserExistWithPhoneNumberUseCase> {
  final IAuthRepository _authRepository;

  VerifyUserExistWithPhoneNumberUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<IFailure, bool>> call(params) async {
    try {
      return await _authRepository.verifyUserExistWithPhoneNumber(
        phoneNumber: params.phoneNumber,
      );
    } on IFailure {
      rethrow;
    } catch (e) {
      return const Left(
        InternalFailure(
          message: 'Falha interna ao verificar o usuário',
        ),
      );
    }
  }
}

class ParamsVerifyUserExistWithPhoneNumberUseCase {
  final String phoneNumber;

  const ParamsVerifyUserExistWithPhoneNumberUseCase({
    required this.phoneNumber,
  });
}
