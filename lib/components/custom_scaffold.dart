import 'package:flutter/material.dart';
import 'package:yellafirstversion/components/app_drawer.dart'; // Import AppDrawer component

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CustomScaffold({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5733),
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: AppDrawer(onItemSelected: () {
        scaffoldKey.currentState?.closeDrawer();
      }),
      body: body,
    );
  }
}