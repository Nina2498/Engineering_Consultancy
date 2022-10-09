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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await _firebaseFirestore.collection("users").doc("user1").set({
                "name": "user1",
                "age": 20,
              });
            },
            child: Text("Add"),
          ),
          ElevatedButton(
            onPressed: () async {
              await _firebaseFirestore.collection("users").doc("user1").update({
                "name": "user1",
                "age": 21,
              });
            },
            child: Text("Update"),
          ),
          ElevatedButton(
            onPressed: () async {
              await _firebaseFirestore.collection("users").doc("user1").delete();
            },
            child: Text("Delete"),
          ),
        ],
      ),
  //     body: Container(
  //     child: Center(
  //     child: Column(
  //       children: [
  //         Text("hello"),
           
  //     ElevatedButton(
  //       onPressed:() {
  //         addName();
  //       } ,
  //       child: Text("add data")
  //       )
  // ],
  //     )
  //     ),
  //   )

  
    );
  }
  addName(){
    _firebaseFirestore.collection("names").add({
      "first name": "sara"
    });
  }
}