import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yellafirstversion/pages/auth_page.dart';
import 'package:yellafirstversion/components/custom_scaffold.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback? onItemSelected;
  const AppDrawer({Key? key, this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Events'),
            onTap: () {
              Navigator.pushNamed(context, '/event_page');
              onItemSelected?.call();}
          ),
          ListTile(
            title: const Text('Map'),
              onTap: () {
                Navigator.pushNamed(context, '/map_page');
                onItemSelected?.call();}
          ),
          ListTile(
            title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile_page');
                onItemSelected?.call();}
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AuthPage()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
          // More navigation items...
        ],
      ),
    );
  }
}