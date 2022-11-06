import 'package:flutter/material.dart';

class advcalculation extends StatefulWidget {
  advcalculation({Key? key}) : super(key: key);

  @override
  State<advcalculation> createState() => _advcalculationState();
}

class _advcalculationState extends State<advcalculation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Calculator'),
      ),
      body: Center(
        child: Text('Advanced Calculator'),
      ),
    
    );
  }
}