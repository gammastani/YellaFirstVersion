import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MenuButton({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
    );
  }
}