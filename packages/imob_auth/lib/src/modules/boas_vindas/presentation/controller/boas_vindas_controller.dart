import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../login/login_module.dart';
import '../../../register/register_module.dart';

part 'boas_vindas_controller.g.dart';

class BoasVindasController = _BoasVindasControllerBase
    with _$BoasVindasController;

abstract class _BoasVindasControllerBase with Store {
  void handleTapFazerLoginButton() {
    Modular.to.pushNamed('..${LoginModule.routeName}');
  }

  void handleTapCadastrarButton() {
    Modular.to.pushNamed('..${RegisterModule.routeName}');
  }
}
