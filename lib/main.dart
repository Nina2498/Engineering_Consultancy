import 'package:flutter/material.dart';

void main() {
  runApp(const Engineering_Consultancy ());
}

class Engineering_Consultancy extends StatelessWidget {
  const Engineering_Consultancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
         title: Text("First Page"), 

      )),
    );
  }
}