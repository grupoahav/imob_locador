import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:imob_informacoes_app/imob_informacoes_app.dart';

import '../../../../core/utils/input_formatters.dart';
import '../controller/confirm_code_controller.dart';

class ConfirmCodePage extends StatefulWidget {
  @override
  _ConfirmCodePageState createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState
    extends ModularState<ConfirmCodePage, ConfirmCodeController>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int timerDuration = 30;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: timerDuration),
    );
    _animationController.forward();

    _animationController.addListener(() {
      if (timerString == '00') {
        Modular.to.pop();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor,
        statusBarIconBrightness: theme.brightness.opposite,
        statusBarBrightness: theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: ImobBackButton(),
                  ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.scale),
                    child: Column(
                      children: [
                        const Text('Código recebido por SMS'),
                        SizedBox(height: 16.scale),
                        TextField(
                          inputFormatters: [smsCodeFormatter],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: theme.colorScheme.primary,
                          maxLength: 6,
                          onChanged: controller.setSmsCode,
                          decoration: const InputDecoration(
                            hintText: '000000',
                          ),
                        ),
                        SizedBox(height: 16.scale),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (ctx, child) {
                            // if (timerString == '00')
                            //   Navigator.of(context).pop();

                            return Text(
                              'Insira o código em $timerString segundos',
                            );
                          },
                        ),
                        SizedBox(height: 16.scale),
                        ImobButton(
                          onPressed: () =>
                              controller.handleTapButtonConfirmar(context),
                          text: 'Confirmar',
                        ),
                        SizedBox(height: 16.scale),
                        const ButtonInformacoesApp(),
                        SizedBox(height: 24.scale),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get timerString {
    final Duration duration =
        _animationController.duration! * _animationController.value;
    final int time = duration.inSeconds % 60;

    return (timerDuration - time).toString().padLeft(2, '0');
  }
}
