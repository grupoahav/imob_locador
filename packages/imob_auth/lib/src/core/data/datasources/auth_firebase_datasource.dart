import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:imob_core/imob_core.dart';

import 'i_auth_remote_datasource.dart';

class AuthFirebaseDatasource implements IAuthRemoteDataSource {
  final CollectionReference _collectionUsers;
  final FirebaseAuth _firebaseAuth;

  const AuthFirebaseDatasource({
    required CollectionReference collectionUsers,
    required FirebaseAuth firebaseAuth,
  })  : _collectionUsers = collectionUsers,
        _firebaseAuth = firebaseAuth;

  @override
  Future<bool> verifyUserExistWithPhoneNumber({
    required String phoneNumber,
  }) async {
    return true;
    // TODO: Verificar com a API o endpoint de verificação de usuário
    // try {
    //   final QuerySnapshot resultQuery = await _collectionUsers
    //       .where('phoneNumber', isEqualTo: phoneNumber)
    //       .get();

    //   return resultQuery.docs.isNotEmpty;
    // } catch (e) {
    //   throw const ServerException(message: 'Falha ao verificar o usuário');
    // }
  }

  @override
  Future<void> saveRemoteFullNameAndPhoneNumber({
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      // TODO: Verificar qual o endpoint, se será FireStore ou API própria
      // await _collectionUsers.where('phoneNumber', isEqualTo: phoneNumber).get();

      // await _collectionUsers.add({
      //   'fullName': fullName,
      //   'phoneNumber': phoneNumber,
      // });

      return;
    } catch (e) {
      throw const ServerException(message: 'Falha ao salvar o usário');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();

      return;
    } catch (e) {
      throw const ServerException(message: 'Falha ao salvar realizar o logout');
    }
  }
}
