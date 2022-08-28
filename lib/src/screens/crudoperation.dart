import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrudOperationScreen extends StatelessWidget {
   CrudOperationScreen({Key? key}) : super(key: key);
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
      child: Center(
      child: Column(
        children: [
          Text("hello"),
           
      ElevatedButton(
        onPressed:() {
          addName();
        } ,
        child: Text("add data")
        )
  ],
      )),
    ));
  }
  addName(){
    _firebaseFirestore.collection("names").add({
      "first name": "sara"
    });
  }
}