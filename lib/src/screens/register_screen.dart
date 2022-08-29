import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("hello"),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            //Form used for validation
            child: Form(child: 
                   Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Username/Email"),
                      TextFormField(
                        //connecting a controller to a text field
                        controller: _userNameController , 
                      ),
                       SizedBox(
                        height: 25,
                      ),
                      Text("Password"),
                      TextFormField(
                        //connecting a controller to a text field
                        controller: _passwordController , 
                        obscureText: true,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 150,
                        child: 
                        ElevatedButton(onPressed: (){
                          //make sure the controllers are not empty
                          debugPrint(" username: ${_userNameController.text}");
                          debugPrint(" password: ${_passwordController.text}");
                          //calling the method
                          RegisterWithEmail(_userNameController.text,
                                            _passwordController.text);
                          
                        },
                        child: Text("Register")))
                    ],
                   )
            ),
          ),
        ],
      ),
    );

  }
   Future <UserCredential>RegisterWithEmail(String email, String password)async{
  //   //creating user
  UserCredential? _userCredential =
   await FirebaseAuth.instance
   .createUserWithEmailAndPassword(email: email, password: password);
   if(_userCredential==null){
    debugPrint("null");
   }
   debugPrint(_userCredential.user!.email.toString());
   return _userCredential;
   //handling errors 
  
//   try {
//   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: emailAddress,
//     password: password,
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//   } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//   }
// } catch (e) {
//   print(e);
// }
   }
}