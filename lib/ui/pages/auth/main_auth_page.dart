import 'package:flutter/material.dart';
import 'package:imob/ui/components/imob_info_button_component.dart';
import 'package:imob/ui/pages/auth/auth_options_page.dart';
import 'package:imob/ui/pages/auth/auth_register_page.dart';
import 'package:imob_design_system/colors/colors.dart';
import 'package:imob_design_system/widgets/imob_button.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 8),
          _buttonBoxComponent(context),
          ImobInfoButtonComponent(),
        ],
      ),
    );
  }

  _buttonBoxComponent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 96),
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ImobButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AuthOptionsPage())),
            text: "Login",
            type: ImobButtonType.primary,
            expanded: true,
          ),
        ),
        SizedBox(height: 48),
        Text(
          "Não tem uma conta?",
          style: TextStyle(
            color: ImobColors.textColor,
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ImobButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AuthRegisterPage())),
            text: "Cadastrar",
            type: ImobButtonType.secondary,
            expanded: true,
          ),
        ),
      ],
    );
  }
}
