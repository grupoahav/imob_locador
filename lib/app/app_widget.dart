import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';

import 'app_module.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtil.builder(
      designUI: DesignUI.iPhone12ProMax,
      designUITablet: DesignUI.iPadPro12dot9,
      builder: (context, constraints, orientation) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Imob - Locador',
          theme: ImobThemes.light,
          initialRoute: AppModule.initialRoute,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
        ).modular();
      },
    );
  }
}
