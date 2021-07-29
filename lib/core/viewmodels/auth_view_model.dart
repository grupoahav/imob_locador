import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthViewModel extends ChangeNotifier {
  String? verificationId;
  User? user;

  MaskTextInputFormatter get phoneMask => MaskTextInputFormatter(
        mask: "+## (##) #####-####",
        filter: {
          "#": RegExp(r'[0-9]'),
        },
      );

  MaskTextInputFormatter get smsCodeMask => MaskTextInputFormatter(
    mask: "#######",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  void setVerificationId(String id) {
    verificationId = id;
  }

  void setUser(User u) {
    user = u;
  }

  void register() {}
}
