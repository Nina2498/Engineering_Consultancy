import 'package:flutter/material.dart';

class Materials extends StatefulWidget {
  Materials({Key? key}) : super(key: key);

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materials'),
      ),
      body: const Center(
        child: Text('Materials'),
      ),
    
    );
  }
}