import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../../../cadastrar_local/cadastrar_local_module.dart';
import '../../../home/home_module.dart';
import '../../../perfil/perfil_module.dart';
import '../controllers/bottom_navigation_controller.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState
    extends ModularState<BottomNavigationPage, BottomNavigationController>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final ThemeData theme = Theme.of(context);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor,
        statusBarIconBrightness: theme.brightness.opposite,
        statusBarBrightness: theme.brightness,
      ),
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: SafeArea(
          child: Scaffold(
            body: ScrollConfiguration(
              behavior: DisableGlowBehavior(),
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.setCurrentIndex,
                children: [
                  HomeModule(),
                  CadastrarLocalModule(),
                  PerfilModule(),
                ],
              ),
            ),
            bottomNavigationBar: ImobBottomNavigationBar(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
