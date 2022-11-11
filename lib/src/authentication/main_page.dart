import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/authentication/HomePage.dart';
import 'package:personal_project/src/authentication/Login_screen.dart';
import 'package:personal_project/src/screens/dashboard_screen.dart';
//import 'package:personal_project/src/screens/Login_screen.dart';
import 'package:personal_project/src/authentication/register_screen.dart';



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
        if(snapshot.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasData){
          return HomeScreen();
        }
        else if(snapshot.hasError){
          return Center(child: Text('Something went wrong'));
        }
        else{
          return HomePage();
        }
      },
      ),
      
    );

  }

}