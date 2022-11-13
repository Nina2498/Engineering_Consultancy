import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_project/src/authentication/HomePage.dart';
import 'package:personal_project/src/authentication/Login_screen.dart';
import 'package:personal_project/src/screens/editprofile.dart';
import 'package:personal_project/src/screens/navigation.dart';
//mport 'package:url_launcher/url_launcher.dart';


class userprofileScreen extends StatefulWidget {
  userprofileScreen({Key? key}) : super(key: key);

  @override
  State<userprofileScreen> createState() => _userprofileScreenState();
}

class _userprofileScreenState extends State<userprofileScreen> {
   final FirebaseAuth auth = FirebaseAuth.instance;
   signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
            title: Text(
              'Profile',
              style:TextStyle(
                color: Color.fromARGB(255, 28, 38, 123),
                fontWeight: FontWeight.bold,
              ) ,

            ),
            backgroundColor: Color.fromARGB(255, 199, 197, 197),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Color.fromARGB(255, 28, 38, 123),
              onPressed: () {
                Navigator.of(context).push( MaterialPageRoute(builder: (context) => navigation()));
                //Navigator.of(context).pop(context, MaterialPageRoute(builder: (context) => navigation()));
              },
            ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
             Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50, 30, 50, 20) ,
               
              child: CircleAvatar(
                radius: 72,
                backgroundColor: Colors.black,
                child:CircleAvatar(
                  radius:70 ,
                  backgroundImage: 
                AssetImage('assets/images/cal1.jpg'),
                  ),
                 ),
                ),
            ],
            
          ),
      
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    
               "FULL NAME" ,
               textAlign: TextAlign.center,
               ),
              //get the name from the firestore
      
              
                ],
              ),
              const SizedBox(
              height: 20,
            ),
               Container(
            padding: EdgeInsets.only(left: 10, right: 250),
            child: 
            Text('About Me', 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
            
          Container(
            margin: EdgeInsets.all(20),
            child: 
        
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
      
          ),
            const SizedBox(
              height: 20,
            ),
            Container(
            padding: EdgeInsets.only(left: 10, right: 260),
            child: Text('Contacts ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
            const SizedBox(
              height: 10,
            ),
              GestureDetector(
              onTap: () async{
                const url='https://www.linkedin.com/feed/';
               
                // if(await canLaunch(url)){
                //   await launch(url);
                // }else{
                //   throw 'Could not launch $url';
                // }
      
      
      
              },
              child: Container(
                color: Color.fromARGB(171, 160, 154, 216),
                width: 370,
                height: 50,
                child: const ListTile(
                  leading: FaIcon(FontAwesomeIcons.linkedin),
                  title: Text("LinkedIn Profile"),
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async{
                const url='https://www.facebook.com/';
               
                // if(await canLaunch(url)){
                //   await launch(url);
                // }else{
                //   throw 'Could not launch $url';
                // }
              },
              child: Container(
                color: Color.fromARGB(171, 203, 154, 216),
                width: 370,
                height: 50,
                child: const ListTile(
                  leading: FaIcon(FontAwesomeIcons.facebook),
                  title: Text("Facebook Profile"),
                )
              ),
            ),
              const SizedBox(
            height: 20,
          ),
          GestureDetector(
             onTap: () async{
               const url = 'https://www.facebook.com/';
                  // if(await canLaunch(url)){
                  //   await launch(url);
                  // }else {
                  //   throw 'Could not launch $url';
                  // }
             },
            child: Container(
              color: Color.fromARGB(171, 210, 216, 154),
              width: 370,
              height: 50,
              child: const ListTile(
                leading: FaIcon(FontAwesomeIcons.google),
                title: Text("My Website"),
              )
            ),

          ),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(50),
                   height: 50,
                   width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                    //navigate to the edit profile screen
                     
                     Navigator.push(context, MaterialPageRoute(builder: (context) => editprofile()));
                    
                    },
                    child: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 28, 38, 123),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  height: 50,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      //sign out 
                      signOut();
                    },
                    child: Text("Log Out"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 28, 38, 123),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      
          ],
        ),
      )
    
    );
  }
}