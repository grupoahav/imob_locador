import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ArgumentsConfirmSmsCode extends Equatable {
  final String verificationId;
  final Function(User? user) onConfirmSmsCode;

  const ArgumentsConfirmSmsCode({
    required this.verificationId,
    required this.onConfirmSmsCode,
  });

  @override
  List<Object> get props => [
        verificationId,
        onConfirmSmsCode,
      ];
}
