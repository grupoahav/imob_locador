import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

TextInputFormatter get phoneNumberInputFormatter => MaskTextInputFormatter(
      mask: '+## (##) # ####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );

TextInputFormatter get smsCodeFormatter => MaskTextInputFormatter(
      mask: '#######',
      filter: {'#': RegExp(r'[0-9]')},
    );
