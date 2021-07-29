import 'package:flutter/material.dart';
import 'package:imob/core/viewmodels/info_view_model.dart';
import 'package:imob/ui/pages/auth/main_auth_page.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:provider/provider.dart';

class ImobApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => InfoViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Imob',
          theme: ImobThemes.main,
          home: MainAuthPage(),
        ));
  }
}
