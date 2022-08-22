import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/crudoperation.dart';

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CrudOperationScreen(),
    );
  }
}