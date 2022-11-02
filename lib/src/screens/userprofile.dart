import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/crudoperation.dart';
import 'package:personal_project/src/screens/dashboard_screen.dart';
import 'package:personal_project/src/screens/register_screen.dart';
import 'package:personal_project/src/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class userprofile extends StatefulWidget {
  userprofile({Key? key}) : super(key: key);

  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(

      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return CrudOperationScreen();
        }else{
          return RegisterScreen();
        }
      },
      ),
      
    );

  }

}