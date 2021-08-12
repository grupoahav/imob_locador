// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardingController on _OnboardingControllerBase, Store {
  final _$currentIndexPageViewAtom =
      Atom(name: '_OnboardingControllerBase.currentIndexPageView');

  @override
  int get currentIndexPageView {
    _$currentIndexPageViewAtom.reportRead();
    return super.currentIndexPageView;
  }

  @override
  set currentIndexPageView(int value) {
    _$currentIndexPageViewAtom.reportWrite(value, super.currentIndexPageView,
        () {
      super.currentIndexPageView = value;
    });
  }

  final _$_OnboardingControllerBaseActionController =
      ActionController(name: '_OnboardingControllerBase');

  @override
  void setCurrentIndexPageView(int index) {
    final _$actionInfo = _$_OnboardingControllerBaseActionController
        .startAction(name: '_OnboardingControllerBase.setCurrentIndexPageView');
    try {
      return super.setCurrentIndexPageView(index);
    } finally {
      _$_OnboardingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndexPageView: ${currentIndexPageView}
    ''';
  }
}
