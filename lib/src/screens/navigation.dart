// import 'package:flutter/material.dart';
// import 'package:personal_project/src/screens/House_Details.dart';
// import 'package:personal_project/src/screens/Login_screen.dart';
// import 'package:personal_project/src/screens/dashboard_screen.dart';

// class navigation extends StatefulWidget {
//   navigation({Key? key}) : super(key: key);

//   @override
//   State<navigation> createState() => _navigationState();
// }

// class _navigationState extends State<navigation> {
//   int currentIndex =0;
//   final screens=[
//     HomeScreen(),
//     HouseDetails(),
//     AddUserDetails("email"),

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

// body: screens[currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color.fromARGB(255, 74, 74, 75),
//         selectedItemColor: Color.fromARGB(255, 234, 226, 235),
//         unselectedItemColor: Colors.white30,
//           currentIndex: currentIndex,
//           onTap: (index)=> setState(()=>currentIndex =index),
         
//         items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.dashboard),
//           label: 'Dashboard',
//           backgroundColor: Color.fromARGB(255, 110, 8, 98),
//         ),
//          BottomNavigationBarItem(
//           icon: Icon(Icons.calculate),
//           label: 'Calculate'
//         ,
//           backgroundColor: Color.fromARGB(255, 96, 7, 111),
//         ),
//          BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//           backgroundColor: Color.fromARGB(255, 124, 4, 90),
//          ),
//         ]
        
    
//     )
//     );
//   }
// }

