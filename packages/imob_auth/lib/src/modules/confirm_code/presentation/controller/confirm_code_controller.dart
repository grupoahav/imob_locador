import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imob_core/imob_core.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:mobx/mobx.dart';

part 'confirm_code_controller.g.dart';

class ConfirmCodeController = _ConfirmCodeControllerBase
    with _$ConfirmCodeController;

abstract class _ConfirmCodeControllerBase with Store {
  final String _verificationId;
  final Function(User? user) _onConfirmSmsCode;

  _ConfirmCodeControllerBase({
    required String verificationId,
    required Function(User? user) onConfirmSmsCode,
  })  : _verificationId = verificationId,
        _onConfirmSmsCode = onConfirmSmsCode;

  @observable
  ControlState state = ControlState.start;
  @observable
  String smsCode = '';

  @action
  setSmsCode(String value) => smsCode = value;

  @action
  Future<void> handleTapButtonConfirmar(BuildContext context) async {
    if (state.isNotLoading) {
      state = ControlState.loading;

      // Create a PhoneAuthCredential with the code
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      _onConfirmSmsCode.call(userCredential.user);
      state = ControlState.success;
    }
  }

  @action
  void _showFailureModal({
    required String title,
    required String failureMessage,
    required BuildContext context,
  }) {
    state = ControlState.failure;
    ImobDialog.show(
      context: context,
      title: title,
      description: failureMessage,
    );
  }

  @computed
  bool get isEnableButtonLogin => smsCode.isNotEmpty;
}
