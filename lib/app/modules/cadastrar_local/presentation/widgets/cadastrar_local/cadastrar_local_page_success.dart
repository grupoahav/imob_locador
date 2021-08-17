import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../place_item_view.dart';

class CadastrarLocalPageSuccess extends StatelessWidget {
  const CadastrarLocalPageSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.scale),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SAR #203',
                  style: theme.textTheme.headline6,
                ),
                Text(
                  'por Felipe Braga de Almeida',
                  style: theme.textTheme.caption,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Column(
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.circular(10.scale),
                      onTap: () {},
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              _buildLine(
                                index != 0,
                                ImobColors.red,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ImobColors.red,
                                    width: 2,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(6.scale),
                                  height: 16,
                                  width: 16,
                                  decoration: const BoxDecoration(
                                    color: ImobColors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              _buildLine(
                                index != 6,
                                ImobColors.red,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsetsDirectional.only(
                                start: 32.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(top: 2.0),
                                        child: Text(
                                          'Dados do Proprietário',
                                          style: theme.textTheme.subtitle1,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 2.0),
                                        child: Text(
                                          'Preenchimento Completo',
                                          style: theme.textTheme.caption,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.chevron_right_rounded)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // _buildVerticalBody(i),
                  ],
                );
              },
              childCount: 7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine(bool visible, Color lineColor) {
    return Container(
      width: visible ? 1.0 : 0.0,
      height: 32.0.scale,
      color: lineColor,
    );
  }
}
