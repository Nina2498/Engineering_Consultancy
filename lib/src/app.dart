import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/Login_screen.dart';
import 'package:personal_project/src/screens/crudoperation.dart';

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: LoginScreen(),

    );
  }
}
//we have to handle if the user already has acc and registed or not how?