import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../place_item_view.dart';

class HomePageSuccess extends StatelessWidget {
  const HomePageSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.scale),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/home/svgs/pin_woman.svg',
                  height: 184.scale,
                ),
                SizedBox(height: 24.scale),
                Text(
                  'Aqui você cadastra e encontra todos seus locais cadastrados.',
                  style: theme.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.scale),
                const Text(
                  'Lembre-se, quanto mais cadastros completos mais chances do seu local ser escolhido.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.scale),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, index) {
              return Container(
                margin: EdgeInsets.only(
                  bottom: 24.0.scale,
                  left: 24.scale,
                  right: 24.scale,
                ),
                child: const PlaceItemView(),
              );
            },
            childCount: 7,
          ),
        ),
      ],
    );
  }
}
