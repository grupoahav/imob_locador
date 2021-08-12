import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:imob_informacoes_app/imob_informacoes_app.dart';

import '../controller/boas_vindas_controller.dart';

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({Key? key}) : super(key: key);

  @override
  _BoasVindasPageState createState() => _BoasVindasPageState();
}

class _BoasVindasPageState
    extends ModularState<BoasVindasPage, BoasVindasController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 48.scale,
          vertical: 24.scale,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Hero(
                tag: ImobSvgs.logo_imob_telecom,
                child: SvgPicture.asset(
                  ImobSvgs.logo_imob_telecom,
                  package: ImobSvgs.package,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            ImobButton(
              onPressed: controller.handleTapFazerLoginButton,
              text: 'Login',
            ),
            SizedBox(height: 48.scale),
            const Text('Não tem uma conta?'),
            SizedBox(height: 16.scale),
            ImobButton(
              onPressed: controller.handleTapCadastrarButton,
              text: 'Cadastrar',
              backgroundColor: ImobColors.white,
              borderColor: theme.colorScheme.primary,
            ),
            SizedBox(height: 16.scale),
            const ButtonInformacoesApp()
          ],
        ),
      ),
    );
  }
}
