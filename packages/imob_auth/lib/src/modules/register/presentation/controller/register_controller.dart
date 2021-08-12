import 'package:flutter/material.dart';
import 'package:imob_core/imob_core.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/utils/input_validators.dart';
import '../../domain/usecases/i_on_register_sucess_usecase.dart';
import '../../domain/usecases/register_pipeline_usecase.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterPipelineUseCase _registerPipelineUseCase;
  final IOnRegisterSucessUseCase _onRegisterSucessUseCase;

  _RegisterControllerBase({
    required RegisterPipelineUseCase registerPipelineUseCase,
    required IOnRegisterSucessUseCase onRegisterSucessUseCase,
  })  : _registerPipelineUseCase = registerPipelineUseCase,
        _onRegisterSucessUseCase = onRegisterSucessUseCase;

  @observable
  ControlState state = ControlState.start;
  @observable
  String phoneNumber = '';
  @observable
  String fullName = '';

  @action
  setPhoneNumber(String value) => phoneNumber = value;

  @action
  setFullName(String value) => fullName = value;

  @action
  Future<void> handleTapButtonContinuar(BuildContext context) async {
    if (state.isNotLoading) {
      state = ControlState.loading;

      await _registerPipeline(
        phoneNumber: phoneNumber,
        fullName: fullName,
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
  Future<void> _registerPipeline({
    required String phoneNumber,
    required String fullName,
    required BuildContext context,
  }) async {
    final failureOrResult = await _registerPipelineUseCase(
      ParamsRegisterPipelineUseCase(
        phoneNumber: phoneNumber,
        fullName: fullName,
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
        final failureOrSucess = await _onRegisterSucessUseCase(
          ParamsOnRegisterSucessUseCase(user: result.user),
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
  bool get isEnableButtonLogin {
    return phoneNumberValidator(phoneNumber) == null &&
        fullNameValidator(fullName) == null;
  }
}
