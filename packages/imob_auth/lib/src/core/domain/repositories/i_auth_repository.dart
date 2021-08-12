import 'package:imob_core/imob_core.dart';

abstract class IAuthRepository {
  /// [Firestore]
  Future<Either<IFailure, bool>> verifyUserExistWithPhoneNumber({
    required String phoneNumber,
  });

  Future<Either<IFailure, void>> saveRemoteFullNameAndPhoneNumber({
    required String fullName,
    required String phoneNumber,
  });

  Future<Either<IFailure, void>> logout();
}
