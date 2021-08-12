import 'package:imob_core/imob_core.dart';
import '../repositories/i_auth_repository.dart';

class LogoutAuthUseCase implements UseCase<void, NoParams> {
  final IAuthRepository _authRepository;

  LogoutAuthUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<IFailure, void>> call(params) async {
    try {
      return _authRepository.logout();
    } catch (e) {
      return const Left(
        InternalFailure(
          message: 'Falha interna ao encerrar a sessão',
        ),
      );
    }
  }
}
