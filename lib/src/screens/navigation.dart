//import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/dashboard_screen.dart';
import 'package:personal_project/src/screens/profile/userprofile.dart';

class navigation extends StatefulWidget {
  navigation({Key? key}) : super(key: key);

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
 
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
   // navigation(),
    userprofileScreen(),
  ];
 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:( _widgetOptions.elementAt(_selectedIndex)),
      
    
  bottomNavigationBar: BottomNavigationBar(
    items:const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Dashboard',
      ),
    
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
     
    ],

    currentIndex: _selectedIndex,
    
     onTap: _onItemTapped,

    
  ),
  
    );
  }
}


       
    