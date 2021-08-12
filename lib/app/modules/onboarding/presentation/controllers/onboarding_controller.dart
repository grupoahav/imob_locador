import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_controller.g.dart';

class OnboardingController = _OnboardingControllerBase
    with _$OnboardingController;

abstract class _OnboardingControllerBase with Store {
  final int kPageViewLength = 4;
  final PageController pageViewController = PageController();

  @observable
  int currentIndexPageView = 0;

  @action
  void setCurrentIndexPageView(int index) => currentIndexPageView = index;
}
