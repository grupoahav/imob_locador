import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserService {
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  static Future<void> addUser(String fullName, String phoneNumber) {
    return _users
        .add({
          'full_name': fullName,
          'phone_number': phoneNumber,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<bool> verifyUserExist(String phoneNumber) async {
    QuerySnapshot querySnapshot =
        await _users.where("phone_number", isEqualTo: phoneNumber).get();
    return querySnapshot.docs.isNotEmpty;
  }
}
