import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imob_core/imob_core.dart';

import '../../../imob_auth_module.dart';
import '../../../modules/confirm_code/confirm_code_module.dart';
import '../../../modules/confirm_code/domain/arguments_confirm_sms_code_entity.dart';

class VerifyPhoneNumberUseCase
    implements UseCase<User, ParamsVerifyPhoneNumberUseCase> {
  @override
  Future<Either<IFailure, User>> call(params) async {
    try {
      final Completer<User?> userCompleter = Completer<User?>();
      User? user;

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: params.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          final UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);

          user = userCredential.user;

          userCompleter.complete(user);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            throw const Failure(message: 'Número não é válido');
          }

          throw const Failure(message: 'Falha ao verificar o código');
        },
        codeSent: (String? verificationId, int? resendToken) async {
          await Modular.to.pushNamed(
            '${ImobAuthModule.routeName}${ConfirmCodeModule.initialRoute}',
            arguments: ArgumentsConfirmSmsCode(
              verificationId: verificationId!,
              onConfirmSmsCode: (User? user) {
                userCompleter.complete(user);
              },
            ),
          );
          if (!userCompleter.isCompleted)
            userCompleter
                .completeError(const CancelSmsCodeFailure(message: ''));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      user = await userCompleter.future;

      if (user == null) throw const Failure(message: 'Usuário nulo');

      return Right(user!);
    } on IFailure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(InternalFailure());
    }
  }
}

class ParamsVerifyPhoneNumberUseCase {
  final String phoneNumber;

  ParamsVerifyPhoneNumberUseCase({
    required this.phoneNumber,
  });
}
