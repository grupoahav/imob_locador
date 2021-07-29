import 'package:firebase_auth/firebase_auth.dart';
import 'package:imob/core/viewmodels/auth_view_model.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class FirebaseAuthService {
  static verifyNumber(String phoneNumber, AuthViewModel vm) async {

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) =>
          _verificationCompleted(credential),
      verificationFailed: (FirebaseAuthException e) => _verificationFailed(e),
      codeSent: (String? verificationId, int? resendToken) {
        vm.setVerificationId(verificationId!);
      },
      codeAutoRetrievalTimeout: (String verificationId) =>
          _codeAutoRetrievalTimeout(verificationId),
    );
  }

  static Future<User?> confirm(String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    UserCredential userCredential = await auth.signInWithCredential(credential);
    return userCredential.user;
  }

  static _verificationCompleted(PhoneAuthCredential credential) async {
    await auth.signInWithCredential(credential);
  }

  static _verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
  }

  static _codeAutoRetrievalTimeout(String verificationId) {}
}
