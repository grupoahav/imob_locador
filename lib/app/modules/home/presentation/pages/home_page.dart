import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_core/imob_core.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_page/home_page_empty.dart';
import '../widgets/home_page/home_page_failure.dart';
import '../widgets/home_page/home_page_loading.dart';
import '../widgets/home_page/home_page_success.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImobIconButton(
                iconSize: 32,
                icon: const Icon(Icons.person_rounded),
                onPressed: () {},
              ),
              SizedBox(width: 4.scale),
              Text(
                'Olá Roberto',
                style: theme.textTheme.bodyText2,
              )
            ],
          ),
          actions: [
            ImobIconButton(
              iconSize: 32,
              icon: const Icon(
                Icons.notifications,
                color: Colors.amber,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            switch (ControlState.success) {
              case ControlState.start:
              case ControlState.loading:
                return const HomePageLoading();
              case ControlState.empty:
                return const HomePageEmpty();
              case ControlState.success:
                return const HomePageSuccess();
              case ControlState.failure:
                return const HomePageFailure();
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
