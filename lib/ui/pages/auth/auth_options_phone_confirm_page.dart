import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imob/core/services/firebase_auth_service.dart';
import 'package:imob/core/viewmodels/auth_view_model.dart';
import 'package:imob/ui/components/imob_info_button_component.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:imob_design_system/widgets/imob_button.dart';
import 'package:provider/provider.dart';

class AuthOptionsPhoneConfirmPage extends StatefulWidget {
  const AuthOptionsPhoneConfirmPage({Key? key}) : super(key: key);

  @override
  State<AuthOptionsPhoneConfirmPage> createState() =>
      _AuthOptionsPhoneConfirmPageState();
}

class _AuthOptionsPhoneConfirmPageState
    extends State<AuthOptionsPhoneConfirmPage>
    with SingleTickerProviderStateMixin {
  final _smsCodeController = TextEditingController();
  late AuthViewModel _viewModel;
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
  }

  @override
  void dispose() {
    _smsCodeController.dispose();
    _animationController.dispose();
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
          "Código recebido por SMS",
          style: TextStyle(color: ImobColors.textColor),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: _smsCodeController,
            inputFormatters: [_viewModel.smsCodeMask],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            cursorColor: ImobColors.primaryColor,
            maxLength: 6,
            decoration: InputDecoration(
              hintText: "000000",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (ctx, child) {
            if (timerString == "00") Navigator.of(context).pop();

            return Text(
              "Insira o códico em $timerString segundos",
              style: TextStyle(color: ImobColors.textColor),
            );
          },
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ImobButton(
            onPressed: _onButtonContinuePressed,
            text: "Confirmar",
            type: ImobButtonType.primary,
            expanded: true,
          ),
        ),
      ],
    );
  }

  String get timerString {
    Duration duration =
        _animationController.duration! * _animationController.value;
    int time = (duration.inSeconds % 60);

    return '${(timerDuration - time).toString().padLeft(2, '0')}';
  }

  _onButtonContinuePressed() async {
    User? user = await FirebaseAuthService.confirm(
        _viewModel.verificationId!, _smsCodeController.text);

    _viewModel.setUser(user!);

    Navigator.of(context).pop(true);
  }
}
