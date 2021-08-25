import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../../../domain/enums/registration_progress_enum.dart';
import '../../../submodules/dados_proprietario/dados_proprietario_module.dart';
import '../imob_line_stepper_widget.dart';
import '../imob_step_widget.dart';

class CadastrarLocalPageSuccess extends StatelessWidget {
  const CadastrarLocalPageSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImobBackButton(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.scale,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SAR #203',
                          style: theme.textTheme.headline5!.merge(
                            TextStyle(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                        // Text(
                        //   'SAR #203',
                        //   style: theme.textTheme.headline6,
                        // ),
                        Text(
                          'por Felipe Braga de Almeida',
                          style: theme.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 24.scale,
                left: 24.scale,
                right: 24.scale,
                bottom: 24 + theme.buttonTheme.height,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return ItemStep(
                      title: 'Dados do Proprietário',
                      progress: EnumRegistrationProgress.values[index % 3],
                      showFinalLine: index < 6,
                      onTap: () {
                        Modular.to.pushNamed(
                          '.${DadosProprietarioModule.routeInitial}',
                        );
                      },
                    );
                  },
                  childCount: 7,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(24.0.scale),
          child: ImobButton(text: 'Continuar Preenchimento', onPressed: () {}),
        ),
      ],
    );
  }
}

class ItemStep extends StatelessWidget {
  const ItemStep({
    Key? key,
    required this.onTap,
    required this.title,
    required this.progress,
    required this.showFinalLine,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final EnumRegistrationProgress progress;
  final bool showFinalLine;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ImobStep(progress: progress),
                  Visibility(
                    visible: showFinalLine,
                    child: ImobLineStep(
                      color: progress.color,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 16.scale),
                  margin: const EdgeInsetsDirectional.only(
                    start: 32.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            title,
                            style: theme.textTheme.subtitle1,
                          ),
                          SizedBox(height: 8.scale),
                          Text(
                            progress.toFormattedString(),
                            style: theme.textTheme.caption,
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
          // _buildVerticalBody(i),
        ],
      ),
    );
  }
}
