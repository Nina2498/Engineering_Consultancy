import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/dashboard_screen.dart';
import 'package:personal_project/src/screens/register_screen.dart';
import 'package:personal_project/src/services/auth_services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      //listenning to the changes 
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child:Text("Loading..."),
          );

        }else if (snapshot.hasError){
          return Text('error: ${snapshot.error}');
        }else if(snapshot.data ==null){
          return NotLoggedIn(context);
        }
        return UserLoggedIn(snapshot.data!.email!);
      });
  }
        



  Widget NotLoggedIn(context){
      return Scaffold(
         backgroundColor: Colors.blueGrey,

      appBar: AppBar(
        title: Text("Login"),
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
                        margin: EdgeInsets.all(8),
                        height: 50,
                        width: 150,
                        color:  Color.fromARGB(255, 131, 71, 129),
                        child: 
                        ElevatedButton(onPressed: ()async{
                          //make sure the controllers are not empty
                          debugPrint(" username: ${_userNameController.text}");
                          debugPrint(" password: ${_passwordController.text}");

                          await _auth.LoginWithEmail(email: _userNameController.text,
                                         password: _passwordController.text).then((value) => print(value.user!.email));
                          
                        },
                        //child: Text("Login")))
                        
                        // child:  Container(
                        //   width: 200,
                        //   height: 100,
                        //  // color: Color.fromARGB(255, 131, 71, 129),
                         

                          child: TextButton(
                          //buttonColor: Colors.deepPurple,
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=>HomeScreen() ));

                          }, 
                          // style: TextButton.styleFrom(
                          // primary: Colors.blueGrey,
                          //  ),
                      
                          child: Text("login",
                          style: TextStyle(
                          color: Colors.white
                       ),
                          
                          ),
                     ),
                        ),
                        ),
                     
                     ],
                   )
            ),
          ),
        ],
      ),
    );
  }

  }
  
Widget UserLoggedIn(String email){

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello Dear $email'),
            ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();

          },
            
          child: Text("Logout")),
      
],
        ),
      ),

    );
}