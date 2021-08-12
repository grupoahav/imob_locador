abstract class IAuthRemoteDataSource {
  Future<bool> verifyUserExistWithPhoneNumber({
    required String phoneNumber,
  });

  Future<void> saveRemoteFullNameAndPhoneNumber({
    required String fullName,
    required String phoneNumber,
  });

  Future<void> logout();
}
