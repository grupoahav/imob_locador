import 'package:imob_core/imob_core.dart';
import 'package:mobx/mobx.dart';

part 'cadastrar_local_controller.g.dart';

class CadastrarLocalController = _CadastrarLocalControllerBase
    with _$CadastrarLocalController;

abstract class _CadastrarLocalControllerBase with Store {
  @observable
  ControlState state = ControlState.start;
}
