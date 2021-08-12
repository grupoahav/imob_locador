// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_code_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfirmCodeController on _ConfirmCodeControllerBase, Store {
  Computed<bool>? _$isEnableButtonLoginComputed;

  @override
  bool get isEnableButtonLogin => (_$isEnableButtonLoginComputed ??=
          Computed<bool>(() => super.isEnableButtonLogin,
              name: '_ConfirmCodeControllerBase.isEnableButtonLogin'))
      .value;

  final _$stateAtom = Atom(name: '_ConfirmCodeControllerBase.state');

  @override
  ControlState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ControlState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$smsCodeAtom = Atom(name: '_ConfirmCodeControllerBase.smsCode');

  @override
  String get smsCode {
    _$smsCodeAtom.reportRead();
    return super.smsCode;
  }

  @override
  set smsCode(String value) {
    _$smsCodeAtom.reportWrite(value, super.smsCode, () {
      super.smsCode = value;
    });
  }

  final _$handleTapButtonConfirmarAsyncAction =
      AsyncAction('_ConfirmCodeControllerBase.handleTapButtonConfirmar');

  @override
  Future<void> handleTapButtonConfirmar(BuildContext context) {
    return _$handleTapButtonConfirmarAsyncAction
        .run(() => super.handleTapButtonConfirmar(context));
  }

  final _$_ConfirmCodeControllerBaseActionController =
      ActionController(name: '_ConfirmCodeControllerBase');

  @override
  dynamic setSmsCode(String value) {
    final _$actionInfo = _$_ConfirmCodeControllerBaseActionController
        .startAction(name: '_ConfirmCodeControllerBase.setSmsCode');
    try {
      return super.setSmsCode(value);
    } finally {
      _$_ConfirmCodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _showFailureModal(
      {required String title,
      required String failureMessage,
      required BuildContext context}) {
    final _$actionInfo = _$_ConfirmCodeControllerBaseActionController
        .startAction(name: '_ConfirmCodeControllerBase._showFailureModal');
    try {
      return super._showFailureModal(
          title: title, failureMessage: failureMessage, context: context);
    } finally {
      _$_ConfirmCodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
smsCode: ${smsCode},
isEnableButtonLogin: ${isEnableButtonLogin}
    ''';
  }
}
