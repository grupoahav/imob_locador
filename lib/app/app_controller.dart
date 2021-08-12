import 'package:imob_core/imob_core.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final INetworkInfo _networkInfo;

  _AppControllerBase({
    required INetworkInfo networkInfo,
  }) : _networkInfo = networkInfo {
    initApp();
  }

  initApp() async {
    await _networkInfo.init();
  }
}
