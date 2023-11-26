// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yellafirstversion/pages/auth_page.dart';
import 'package:yellafirstversion/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await Firebase.initializeApp();
  //   print('Firebase initialized successfully');
    runApp(MaterialApp(
        home: LoginPage()));
  // } catch (e) {
  //   print('Error initializing Firebase: $e');
  // }
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