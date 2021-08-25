import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_core/imob_core.dart';

import '../controllers/cadastrar_local_controller.dart';
import '../widgets/cadastrar_local/cadastrar_local_page_empty.dart';
import '../widgets/cadastrar_local/cadastrar_local_page_failure.dart';
import '../widgets/cadastrar_local/cadastrar_local_page_loading.dart';
import '../widgets/cadastrar_local/cadastrar_local_page_success.dart';

class CadastrarLocalPage extends StatefulWidget {
  @override
  _CadastrarLocalPageState createState() => _CadastrarLocalPageState();
}

class _CadastrarLocalPageState
    extends ModularState<CadastrarLocalPage, CadastrarLocalController>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'Novo local',
        //     // style: theme.textTheme.bodyText2,
        //   ),
        // ),
        body: Observer(
          builder: (_) {
            switch (ControlState.success) {
              case ControlState.start:
              case ControlState.loading:
                return const CadastrarLocalPageLoading();
              case ControlState.empty:
                return const CadastrarLocalPageEmpty();
              case ControlState.success:
                return const CadastrarLocalPageSuccess();
              case ControlState.failure:
                return const CadastrarLocalPageFailure();
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
