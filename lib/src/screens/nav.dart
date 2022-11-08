// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';

// class nav extends StatefulWidget {
//   nav({Key? key}) : super(key: key);

//   @override
//   State<nav> createState() => _navState();
// }

// class _navState extends State<nav> {

//   final items= const [
//     BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
    
//     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//   ];
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       bottomNavigationBar: CurvedNavigationBar(
//         items: items,
//         index: index,
//         onTap: (selectedIndex){
//           setState(() {
//             index = selectedIndex;
//           });
        
//         },
//         height: 70,
//         backgroundColor: Colors.transparent,
//       ),
//     );
//   }
// }