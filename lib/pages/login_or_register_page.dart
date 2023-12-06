import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yellafirstversion/components/my_button.dart';
import 'package:yellafirstversion/components/my_textfield.dart';
import 'package:yellafirstversion/pages/login_page.dart';
import 'package:yellafirstversion/pages/register_page.dart';
import 'home_page.dart';

class LoginOrRegisterPage extends StatefulWidget{
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage>{

  bool showLoginPage = true;

  void togglePages(){
    setState((){
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context){
    if(showLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    }else{
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}