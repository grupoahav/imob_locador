import 'package:flutter/material.dart';
import 'package:imob/core/services/firebase_auth_service.dart';
import 'package:imob/core/services/firebase_user_service.dart';
import 'package:imob/core/viewmodels/auth_view_model.dart';
import 'package:imob/ui/components/imob_info_button_component.dart';
import 'package:imob/ui/dialogs/imob_dialog.dart';
import 'package:imob/ui/dialogs/present_dialog.dart';
import 'package:imob/ui/pages/auth/auth_options_phone_confirm_page.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:imob_design_system/widgets/imob_button.dart';
import 'package:provider/provider.dart';

class AuthRegisterPage extends StatefulWidget {
  const AuthRegisterPage({Key? key}) : super(key: key);

  @override
  State<AuthRegisterPage> createState() => _AuthRegisterPageState();
}

class _AuthRegisterPageState extends State<AuthRegisterPage> {
  late AuthViewModel viewModel;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<AuthViewModel>(context);

    return ImobPage(
        hasBackButton: true,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImobInfoButtonComponent(),
              ],
            ),
            Container(
              color: Color.fromRGBO(254, 254, 254, 1),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: _buttonBoxComponent(),
              ),
            ),
          ],
        ));
  }

  _buttonBoxComponent() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 64, right: 64, bottom: 64, top: 64),
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
          Text(
            "Cadastre-se",
            style: TextStyle(
                color: ImobColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          SizedBox(height: 64),
          Text(
            "Nome completo",
            style: TextStyle(
              color: ImobColors.textColor,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: fullNameController,
              textAlign: TextAlign.center,
              cursorColor: ImobColors.primaryColor,
              onFieldSubmitted: (_) => phoneFocus.requestFocus(),
              decoration: InputDecoration(
                hintText: "Seu nome",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Esse campo é obrigatório';
                } else if (value.split(" ").length < 2 || value.length < 10) {
                  return 'Precisamos do seu nome completo';
                }

                return null;
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Telefone",
            style: TextStyle(
              color: ImobColors.textColor,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: phoneController,
              focusNode: phoneFocus,
              inputFormatters: [viewModel.phoneMask],
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              cursorColor: ImobColors.primaryColor,
              onFieldSubmitted: (_) => _registerButtonPressed(),
              decoration: InputDecoration(
                hintText: "+00 (00) 00000-0000",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Esse campo é obrigatório';
                } else if (phoneController.text.length != 19) {
                  return 'Número incorreto';
                }

                return null;
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ImobButton(
              onPressed: _registerButtonPressed,
              text: "Cadastrar",
              type: ImobButtonType.primary,
              expanded: true,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  _registerButtonPressed() async {
    if (!_formKey.currentState!.validate()) return;

    bool userExist =
        await FirebaseUserService.verifyUserExist(phoneController.text);

    if (userExist) {
      PresentDialog.show(
          context,
          ImobDialog("Atenção",
              "Esse número já foi cadastrado! Tente um outro número."));
      phoneController.text = "";
      phoneFocus.requestFocus();
      return;
    }

    FirebaseAuthService.verifyNumber(phoneController.text, viewModel);

    bool success = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => AuthOptionsPhoneConfirmPage()));

    if (success) {
      FirebaseUserService.addUser(
          fullNameController.text, phoneController.text);

      print("Usuário adicionado com sucesso"); //exibir mensagem

      Navigator.of(context).pop();
    }
  }
}
