import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yellafirstversion/pages/auth_page.dart';
import 'package:yellafirstversion/pages/login_page.dart';
import 'package:yellafirstversion/pages/profile_page.dart';
import 'package:yellafirstversion/pages/map_page.dart';
import 'package:yellafirstversion/pages/event_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login_page': (context) => LoginPage(onTap: () {  },),
        '/event_page': (context) => EventPage(),
        '/profile_page': (context) => ProfilePage(),
        '/map_page': (context) => MapPage(),
        // ... other routes
      },
      home: AuthPage(),
    );
  }
}