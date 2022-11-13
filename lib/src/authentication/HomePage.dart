import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/authentication/HomePage.dart';
import 'package:personal_project/src/authentication/register_screen.dart';
import 'package:personal_project/src/authentication/Login_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    void toggle() {
      setState(() {
        isSignIn = !isSignIn;
      });
    }

    return isSignIn
        ? LoginScreen(onClickSignUp: toggle)
        : RegisterPage(onClickedSignIn: toggle);
  }
}