// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool>? _$isLoginValidatedComputed;

  @override
  bool get isLoginValidated => (_$isLoginValidatedComputed ??= Computed<bool>(
          () => super.isLoginValidated,
          name: '_LoginControllerBase.isLoginValidated'))
      .value;
  Computed<bool>? _$isEnableButtonLoginComputed;

  @override
  bool get isEnableButtonLogin => (_$isEnableButtonLoginComputed ??=
          Computed<bool>(() => super.isEnableButtonLogin,
              name: '_LoginControllerBase.isEnableButtonLogin'))
      .value;

  final _$stateAtom = Atom(name: '_LoginControllerBase.state');

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

  final _$phoneNumberAtom = Atom(name: '_LoginControllerBase.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$handleTapButtonLoginAsyncAction =
      AsyncAction('_LoginControllerBase.handleTapButtonLogin');

  @override
  Future<void> handleTapButtonLogin(BuildContext context) {
    return _$handleTapButtonLoginAsyncAction
        .run(() => super.handleTapButtonLogin(context));
  }

  final _$_loginPipelineAsyncAction =
      AsyncAction('_LoginControllerBase._loginPipeline');

  @override
  Future<void> _loginPipeline(
      {required String phoneNumber, required BuildContext context}) {
    return _$_loginPipelineAsyncAction.run(
        () => super._loginPipeline(phoneNumber: phoneNumber, context: context));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setPhoneNumber(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _showFailureModal(
      {required String title,
      required String failureMessage,
      required BuildContext context}) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase._showFailureModal');
    try {
      return super._showFailureModal(
          title: title, failureMessage: failureMessage, context: context);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
phoneNumber: ${phoneNumber},
isLoginValidated: ${isLoginValidated},
isEnableButtonLogin: ${isEnableButtonLogin}
    ''';
  }
}
