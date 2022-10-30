import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/services/auth_services.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  //access Auth class and use the method
  final Auth  _auth=  Auth();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[300],
       appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Color.fromARGB(255, 63, 58, 58),
        centerTitle: true,
      ),
      body: Column(
        
        children: [
          
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
                       Container(
                        padding: EdgeInsets.fromLTRB(0, 0,220, 0),
                        child: Text("Name", 
                        style: TextStyle(
                          color: (Color.fromARGB(170, 148, 19, 120)),
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      TextFormField(
                        //connecting a controller to a text field
                        controller: _nameController , 
                      ),
                      SizedBox(
                        height: 20,
                      ),
                       Container(
                        padding: EdgeInsets.fromLTRB(0, 0,220, 0),
                        child: Text("Username/Email", 
                        style: TextStyle(
                          color: (Color.fromARGB(170, 148, 19, 120)),
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      TextFormField(
                        //connecting a controller to a text field
                        controller: _userNameController , 
                      ),
                       SizedBox(
                        height: 25,
                      ),
                     Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 260, 0),
                        child: Text("Password",
                        style: TextStyle(
                          color: (Color.fromARGB(170, 148, 19, 120)),
                          fontWeight: FontWeight.bold,
                        ),)),
                      TextFormField(
                        //connecting a controller to a text field
                        controller: _passwordController , 
                        obscureText: true,
                      ),

                       SizedBox(
                        height: 25,
                      ),
                    
                        ElevatedButton(
                           style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(170, 148, 19, 120))
                           ),
                          
                          onPressed: (){
                          //make sure the controllers are not empty
                          debugPrint(" username: ${_userNameController.text}");
                          debugPrint(" password: ${_passwordController.text}");
                          //calling the method
                         _auth.RegisterWithEmail(_userNameController.text,
                                            _passwordController.text);
                          
                        },
                       child: Container(
                              margin: EdgeInsets.all(15),
                              child: Text("Register",
                              style: TextStyle(
                                fontSize: 15
                              ),
                   )
                    )
                    )
                     
                    ],
                   )
            ),
          ),
        ],
      ),
    );

  }
  
}