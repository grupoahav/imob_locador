import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_core/imob_core.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ImobLogger.init(const ImobLoggerConfig.pretty());

  FlutterError.onError = (FlutterErrorDetails details) {
    ImobLogger.instance.error(stackTrace: details.stack);
  };

  Modular.to.addListener(() {
    ImobLogger.instance.information(description: '[FLOW] ${Modular.to.path}');
  });

  await Firebase.initializeApp();
  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
