import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/House_Details.dart';
import 'package:personal_project/src/screens/Login_screen.dart';
import 'package:personal_project/src/screens/dashboard_screen.dart';
import 'package:personal_project/src/screens/userprofile.dart';

class navigation extends StatefulWidget {
  navigation({Key? key}) : super(key: key);

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  int currentIndex =0;
  final screens=[
    HomeScreen(),
    userprofileScreen(),
    

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 199, 197, 197),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 199, 197, 197),
        color: Color.fromARGB(255, 106, 54, 158),
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index){
          setState(() {
            currentIndex=index;
          },  );
        },
         items: [
        Icon(
          Icons.home,
           size: 30,
           color: Colors.white,
           ),
        Icon(
          Icons.settings,
           size: 30,
           color: Colors.white,
           ),
      
      ],
       
      ),
    );
  }
}

