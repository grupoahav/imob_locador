import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imob/core/viewmodels/auth_view_model.dart';
import 'package:imob/core/viewmodels/global_view_model.dart';
import 'package:imob/imob_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => GlobalViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthViewModel(),
      ),
    ],
    child: ImobApp(),
  ));
}
