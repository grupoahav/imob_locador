// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool>? _$isEnableButtonLoginComputed;

  @override
  bool get isEnableButtonLogin => (_$isEnableButtonLoginComputed ??=
          Computed<bool>(() => super.isEnableButtonLogin,
              name: '_RegisterControllerBase.isEnableButtonLogin'))
      .value;

  final _$stateAtom = Atom(name: '_RegisterControllerBase.state');

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

  final _$phoneNumberAtom = Atom(name: '_RegisterControllerBase.phoneNumber');

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

  final _$fullNameAtom = Atom(name: '_RegisterControllerBase.fullName');

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$handleTapButtonContinuarAsyncAction =
      AsyncAction('_RegisterControllerBase.handleTapButtonContinuar');

  @override
  Future<void> handleTapButtonContinuar(BuildContext context) {
    return _$handleTapButtonContinuarAsyncAction
        .run(() => super.handleTapButtonContinuar(context));
  }

  final _$_registerPipelineAsyncAction =
      AsyncAction('_RegisterControllerBase._registerPipeline');

  @override
  Future<void> _registerPipeline(
      {required String phoneNumber,
      required String fullName,
      required BuildContext context}) {
    return _$_registerPipelineAsyncAction.run(() => super._registerPipeline(
        phoneNumber: phoneNumber, fullName: fullName, context: context));
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic setPhoneNumber(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFullName(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setFullName');
    try {
      return super.setFullName(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _showFailureModal(
      {required String title,
      required String failureMessage,
      required BuildContext context}) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase._showFailureModal');
    try {
      return super._showFailureModal(
          title: title, failureMessage: failureMessage, context: context);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
phoneNumber: ${phoneNumber},
fullName: ${fullName},
isEnableButtonLogin: ${isEnableButtonLogin}
    ''';
  }
}
