import 'package:flutter/material.dart';
import 'package:imob_core/imob_core.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/i_on_login_sucess_usecase.dart';
import '../../domain/usecases/login_pipeline_usecase.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginPipelineUseCase _loginPipelineUseCase;
  final IOnLoginSucessUseCase _loginSucessUseCase;

  _LoginControllerBase({
    required LoginPipelineUseCase loginUseCase,
    required IOnLoginSucessUseCase loginSucessUseCase,
  })  : _loginPipelineUseCase = loginUseCase,
        _loginSucessUseCase = loginSucessUseCase;

  @observable
  ControlState state = ControlState.start;
  @observable
  String phoneNumber = '';

  @action
  setPhoneNumber(String value) => phoneNumber = value;

  @action
  Future<void> handleTapButtonLogin(BuildContext context) async {
    if (state.isNotLoading) {
      state = ControlState.loading;

      await _loginPipeline(
        phoneNumber: phoneNumber,
        context: context,
      );
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

  @action
  Future<void> _loginPipeline({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    final failureOrResult = await _loginPipelineUseCase(
      ParamsLoginPipelineUseCase(
        phoneNumber: phoneNumber,
      ),
    );

    await failureOrResult.fold(
      (failure) {
        if (failure is CancelSmsCodeFailure) {
          state = ControlState.start;
        } else {
          _showFailureModal(
            title: 'Falha ao fazer o Login',
            failureMessage: failure.message,
            context: context,
          );
        }
      },
      (result) async {
        final failureOrSucess = await _loginSucessUseCase(
          ParamsOnLoginSucessUseCase(user: result.user),
        );

        failureOrSucess.fold(
          (failure) => _showFailureModal(
            title: 'Falha ao fazer o Login',
            failureMessage: failure.message,
            context: context,
          ),
          (sucess) => state = ControlState.sucess,
        );
      },
    );
  }

  @computed
  bool get isLoginValidated => phoneNumber.isEmpty;

  @computed
  bool get isEnableButtonLogin => phoneNumber.isNotEmpty;
}
