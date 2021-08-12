import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imob_core/imob_core.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:imob_informacoes_app/imob_informacoes_app.dart';

import '../../../../core/utils/input_formatters.dart';
import '../../../../core/utils/input_validators.dart';
import '../controller/register_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48.scale,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cadastrar-se',
                            style: theme.textTheme.headline5!.merge(
                              TextStyle(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.scale),
                          const Text('Nome completo'),
                          SizedBox(height: 8.scale),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: 'Seu nome...',
                            ),
                            onChanged: controller.setFullName,
                            validator: fullNameValidator,
                          ),
                          SizedBox(height: 16.scale),
                          const Text('Telefone'),
                          SizedBox(height: 8.scale),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            inputFormatters: [phoneNumberInputFormatter],
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              hintText: '+55 00 00000-0000',
                            ),
                            onChanged: controller.setPhoneNumber,
                            onFieldSubmitted: (_) {
                              if (formKey.currentState!.validate()) {
                                controller.handleTapButtonContinuar(context);
                              }
                            },
                            validator: phoneNumberValidator,
                          ),
                          SizedBox(height: 16.scale),
                          Observer(
                            builder: (context) {
                              return ImobButton(
                                onPressed: !controller.isEnableButtonLogin
                                    ? null
                                    : () {
                                        if (formKey.currentState!.validate()) {
                                          return controller
                                              .handleTapButtonContinuar(
                                                  context);
                                        }
                                      },
                                text: 'Continuar',
                                isLoading: controller.state.isLoading,
                              );
                            },
                          ),
                          SizedBox(height: 40.scale),
                          const Text('ou logar com'),
                          SizedBox(height: 16.scale),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: ImobButton(
                                  onPressed: () {},
                                  text: 'Facebook',
                                  backgroundColor: const Color(0xFF3B5999),
                                ),
                              ),
                              SizedBox(width: 16.scale),
                              Expanded(
                                child: ImobButton(
                                  onPressed: () {},
                                  text: 'Google',
                                  backgroundColor: const Color(0xFFDD4C39),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.scale),
                          const ButtonInformacoesApp(),
                          SizedBox(height: 24.scale),
                        ],
                      ),
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
}
