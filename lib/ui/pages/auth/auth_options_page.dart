import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imob/core/services/firebase_auth_service.dart';
import 'package:imob/core/services/firebase_user_service.dart';
import 'package:imob/core/viewmodels/auth_view_model.dart';
import 'package:imob/ui/components/imob_info_button_component.dart';
import 'package:imob/ui/dialogs/imob_dialog.dart';
import 'package:imob/ui/dialogs/present_dialog.dart';
import 'package:imob/ui/pages/auth/auth_options_phone_confirm_page.dart';
import 'package:imob/ui/pages/auth/main_auth_page.dart';
import 'package:imob/ui/pages/main_content_page.dart';
import 'package:imob_design_system/colors/colors.dart';
import 'package:imob_design_system/widgets/imob_button.dart';
import 'package:provider/provider.dart';

class AuthOptionsPage extends StatefulWidget {
  const AuthOptionsPage({Key? key}) : super(key: key);

  @override
  State<AuthOptionsPage> createState() => _AuthOptionsPageState();
}

class _AuthOptionsPageState extends State<AuthOptionsPage> {
  final _phoneNumberController = TextEditingController();
  AuthViewModel? _viewModel;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: _buttonBoxComponent(context),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ImobInfoButtonComponent(),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back_outlined)),
            ],
          ),
        ]),
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
        Text(
          "Telefone",
          style: TextStyle(color: ImobColors.textColor),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            inputFormatters: [_viewModel!.phoneMask],
            controller: _phoneNumberController,
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center,
            cursorColor: ImobColors.primaryColor,
            decoration: InputDecoration(
              hintText: "+55 00 00000-0000",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ImobButton(
            onPressed: _onButtonContinuePressed,
            text: "Enviar",
            type: ImobButtonType.primary,
            expanded: true,
          ),
        ),
      ],
    );
  }

  _onButtonContinuePressed() async {
    bool userExist =
        await FirebaseUserService.verifyUserExist(_phoneNumberController.text);

    if (!userExist) {
      PresentDialog.show(
          context, ImobDialog("Atenção", "Esse número não foi cadastrado."));
      return;
    }

    FirebaseAuthService.verifyNumber(_phoneNumberController.text, _viewModel!);

    bool success = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => AuthOptionsPhoneConfirmPage()));

    if (success) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => MainContentPage()),
          (route) => route == MainAuthPage());
    }
  }
}
