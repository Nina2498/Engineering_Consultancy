import 'package:flutter/material.dart';
import 'package:personal_project/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:personal_project/src/authentication/Login_screen.dart';
import 'package:personal_project/src/authentication/register_screen.dart';



void main() async{
  //flutter ensure 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const app());
}
