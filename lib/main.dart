import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yellafirstversion/pages/auth_page.dart';
import 'package:yellafirstversion/pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MaterialApp(
        home: LoginPage()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}