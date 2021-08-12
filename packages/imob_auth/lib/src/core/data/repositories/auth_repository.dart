import 'package:imob_core/imob_core.dart';

import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/i_auth_remote_datasource.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource _remoteDataSource;
  final INetworkInfo _networkInfo;

  AuthRepository({
    required IAuthRemoteDataSource remoteDataSource,
    required INetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<IFailure, bool>> verifyUserExistWithPhoneNumber({
    required String phoneNumber,
  }) async {
    final bool isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      try {
        final bool hasUser = await _remoteDataSource
            .verifyUserExistWithPhoneNumber(phoneNumber: phoneNumber);

        return Right(hasUser);
      } on ServerException catch (e) {
        return Left(
          ServerFailure(
            message: e.message,
          ),
        );
      }
    } else {
      return const Left(InternetConectionFailure());
    }
  }

  @override
  Future<Either<IFailure, void>> saveRemoteFullNameAndPhoneNumber({
    required String fullName,
    required String phoneNumber,
  }) async {
    final bool isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      try {
        await _remoteDataSource.saveRemoteFullNameAndPhoneNumber(
          fullName: fullName,
          phoneNumber: phoneNumber,
        );

        return Right(voidRight);
      } on ServerException catch (e) {
        return Left(
          ServerFailure(
            message: e.message,
          ),
        );
      }
    } else {
      return const Left(InternetConectionFailure());
    }
  }

  @override
  Future<Either<IFailure, void>> logout() async {
    final bool isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      try {
        await _remoteDataSource.logout();

        return Right(voidRight);
      } on ServerException catch (e) {
        return Left(
          ServerFailure(
            message: e.message,
          ),
        );
      }
    } else {
      return const Left(InternetConectionFailure());
    }
  }
}
