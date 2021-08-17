import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../controllers/onboarding_controller.dart';

class PageViewOnboarding extends StatelessWidget {
  final OnboardingController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: controller.setCurrentIndexPageView,
      controller: controller.pageViewController,
      allowImplicitScrolling: true,
      physics: const BouncingScrollPhysics(),
      children: const [
        _InfosPageView(
          title: 'Cadastre seu espaço',
          content:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
          svgPath: 'assets/onboarding/svgs/cadastre_seu_espaco.svg',
        ),
        _InfosPageView(
          title: 'Receba respostas',
          content:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
          svgPath: 'assets/onboarding/svgs/receba_respostas.svg',
        ),
        _InfosPageView(
          title: 'Feche contrato de locacao',
          content:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
          svgPath: 'assets/onboarding/svgs/feche_contrato_de_locacao.svg',
        ),
        _InfosPageView(
          title: 'Receba o aluguel',
          content:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
          svgPath: 'assets/onboarding/svgs/receba_aluguel.svg',
        ),
      ],
    );
  }
}

class _InfosPageView extends StatelessWidget {
  final String title;
  final String content;
  final String svgPath;

  const _InfosPageView({
    required this.title,
    required this.content,
    required this.svgPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.scale),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SvgPicture.asset(
              svgPath,
              height: 200.scale,
            ),
          ),
          SizedBox(height: 32.scale),
          Text(
            title,
            style: theme.textTheme.headline5!.merge(
              TextStyle(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: 16.scale),
          Flexible(
            child: Text(
              content,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
