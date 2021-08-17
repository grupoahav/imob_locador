import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../../../bottom_navigation/bottom_navigation_module.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/page_indicator_onboarding_widget.dart';
import '../widgets/pageview_onboarding_widget.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState
    extends ModularState<OnboardingPage, OnboardingController> {
  @override
  void dispose() {
    controller.pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor,
        statusBarIconBrightness: theme.brightness.opposite,
        statusBarBrightness: theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 24.scale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ImobBackButton(),
                  Expanded(child: PageViewOnboarding()),
                  SizedBox(height: 16.scale),
                  PageIndicatorOnboarding(),
                  SizedBox(height: 16.scale),
                  Observer(builder: (_) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.scale),
                      child: ImobButton.secondary(
                        onPressed: () {
                          if (controller.currentIndexPageView == 3) {
                            Modular.to
                                .navigate(BottonNavigationModule.routeInitial);
                          } else {
                            controller.pageViewController.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        backgroundColor: controller.currentIndexPageView ==
                                controller.kPageViewLength - 1
                            ? ImobColors.yellow
                            : null,
                        textColor: theme.colorScheme.onPrimary,
                        text: controller.currentIndexPageView ==
                                controller.kPageViewLength - 1
                            ? 'Começar'
                            : 'Próximo',
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
