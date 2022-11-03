// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// //needs to import firebase_auth and material
// //how can we use these methods? by instantiating and creating objects 
// class Auth{

//   //FutureBuilder is a Widget that will help you to execute some asynchronous function and based on that function’s result your UI will update.
//    Future <UserCredential>RegisterWithEmail(String email, String password)async{
    
//      //TODO: AFTER the class move the method here
//     //creating user
    
//   UserCredential? _userCredential =
//    await FirebaseAuth.instance
//    .createUserWithEmailAndPassword(
//    email: email, password: password
//    );
//    //handdle the error
   
//    if(_userCredential==null){
//     debugPrint("null");
//    }
//    debugPrint(_userCredential.user!.email.toString());
//    return _userCredential;
   
//    //handling errors 

  

//    }
  
//   Future <UserCredential>LoginWithEmail({ required String email, required String password})
//   {
//     return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//   }
  
// }
