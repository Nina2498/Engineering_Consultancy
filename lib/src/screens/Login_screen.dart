import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/app.dart';
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
    //stream builder is used to listen to the stream of data
   //future builder is used to listen to the future of data
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
        
        }else if(snapshot.data !=null){
          return UserLoggedIn(context); 
        } 
        return AddUserDetails(snapshot.data!.email!);
        
      });
  }
        

//widget for the user not logged in
//widget is a function that used to return a widget
//context is the information about the widget tree


  Widget NotLoggedIn(context){
      return Scaffold(
         backgroundColor: Colors.grey[300],

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
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0,220, 0),
                        child: Text("Username/Email", 
                        style: TextStyle(
                           color: (Color.fromARGB(170, 148, 19, 120)),
                          fontWeight: FontWeight.bold)
                        ),
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
                          fontWeight: FontWeight.bold)
                        ),
                         
                          ),
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
                        child: Text("Not Registered yet? Register here",
                        style: TextStyle(
                          color: Colors.black54
                        ),)),
                      SizedBox(
                        height: 25,
                      ),
                    
                      
                         
                           ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(170, 148, 19, 120))
                            ),
                            
                            onPressed: ()async{
                            //make sure the controllers are not empty
                            debugPrint(" username: ${_userNameController.text}");
                            debugPrint(" password: ${_passwordController.text}");

                            await _auth.LoginWithEmail(email: _userNameController.text,
                                           password: _passwordController.text).then((value) => print(value.user!.email));
                            
                          },
                          
                            
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Text("Login",
                              style: TextStyle(
                                fontSize: 15
                              ),))
                            
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
  //widget for the user logged in
  //when user is logged in, the user will be redirected to the welcome screen
  
Widget UserLoggedIn(context){

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("WELCOME"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 63, 58, 58), 
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 50, 5, 10),
              

              child: Image.asset("assets/images/eng.jpg"),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50,10,50,10),
              child: Text("This Application Estimate Cost of Your Constructions",
                            style: TextStyle(
                            color: Colors.black87,
                            fontSize: 23
                         ),
                         ),
            ),
            
            //Text('Welcome $email!'),
                   TextButton(
                          
                    onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                   builder: (context)=>HomeScreen() ));

                          },
                      
                          child: Text("Get Start!",
                          style: TextStyle(
                          color: Color.fromARGB(170, 148, 19, 120),
                          fontSize: 30
                       ),
                          
                          ),
                     ),



        // user can logout from the app

            Padding(
              padding: const EdgeInsets.fromLTRB(300,150,0,0),
              child: ElevatedButton(
                style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(170, 148, 19, 120)
                   )

                ),
                onPressed: (){
                  FirebaseAuth.instance.signOut();

          },
              
          child: Icon(Icons.logout_rounded),
         
          ),
            ),
        

      //   floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     FirebaseAuth.instance.signOut();
      //   },
      //   child: Icon(Icons.logout_rounded),
      //   backgroundColor: Colors.green,
      // ),


      
],
        ),
      ),

    );
}

// user profile page 
 Widget AddUserDetails(String email){

    return Scaffold(
      appBar: AppBar(
        title: Text("USER PROFILE"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello Dear $email'),
            //  TextButton(
                          
                  //   onPressed: (){
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //  builder: (context)=>HomeScreen() ));

                  //         },
                      
                  //         child: Text("Get Start!",
                  //         style: TextStyle(
                  //         color: Color.fromARGB(170, 148, 19, 120),
                  //         fontSize: 30
                  //      ),
                          
                  //         ),
                  //    ),

      



      //  ],
      //   onTap: (index)=> currentIndex =index,
      //     currentIndex: 1,
      //  ),

  
      
],
        ),
      ),

    );
}


                