import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onboarding_controller.dart';

class PageIndicatorOnboarding extends StatelessWidget {
  final controller = Modular.get<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: SmoothPageIndicator(
        controller: controller.pageViewController,
        count: controller.kPageViewLength,
        effect: ScaleEffect(
          activePaintStyle: PaintingStyle.stroke,
          paintStyle: PaintingStyle.fill,
          spacing: 15.scale,
          radius: 25.scale,
          dotWidth: 12.scale,
          dotHeight: 12.scale,
          activeStrokeWidth: 3.scale,
          scale: 1.7.scale,
          dotColor: theme.colorScheme.primary,
          activeDotColor: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
