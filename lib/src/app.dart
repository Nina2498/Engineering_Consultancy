import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/HomePage.dart';
import 'package:personal_project/src/screens/Login_screen.dart';
import 'package:personal_project/src/screens/main_page.dart';


class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
     
      home: HomePage(),

    );
  }
}
