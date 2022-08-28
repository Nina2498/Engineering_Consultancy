import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>RegisterScreen() ));

                        }, 
                        child: Text("Not Registered yet? Register here")),
                      SizedBox(
                        height: 25,
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
                          
                        },
                        child: Text("Login")))
                    ],
                   )
            ),
          ),
        ],
      ),
    );
  }
}