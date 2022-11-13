

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/models/user.dart';
import 'package:personal_project/src/authentication/Login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:personal_project/src/screens/navigation.dart';

class RegisterPage extends StatefulWidget {
const  RegisterPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  final VoidCallback onClickedSignIn;
  
  @override
  State<RegisterPage> createState() => _RegisterPageState();
  
}


class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController  _usernameController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();


   final auth = FirebaseAuth.instance;
   final _formKey = GlobalKey<FormState>();

 
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
  Future signUp() async{
  final isvalid = _formKey.currentState!.validate();
  if(!isvalid) return;
    try{
      await auth.createUserWithEmailAndPassword(

    
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim())
        .then((value) => sendInfoForCloudFirestore(

        ));
        //nav to dashboard 
        Navigator.push(context, MaterialPageRoute(builder: (context) => navigation()));
      
    } on FirebaseAuthException catch(e){
      print(e.message);
    }
  }
  //create sendInfoForCloudFirestore() function
  sendInfoForCloudFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uID = user.uid;
    userModel.name = user.displayName;
    userModel.image = user.photoURL;
    await firestore.collection("users").doc(user.uid).set(userModel.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    "Create Your Account",
                    style:(TextStyle(
                        fontSize: 26,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0B2E40)
                        )
                  ),
                )
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Please Enter Your Credentials in the Form Below..!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7E7B7B)),
                )
                ),

            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{5,}$');
                          if (value!.isEmpty) {
                            return ("Username cannot be Empty");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid name(Min. 5 Character)");
                          }
                          return null;
                        },
                        controller: _usernameController,
                        style:TextStyle(),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Username",
                        
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                        controller: _emailController,
                        style: (TextStyle()),
                        decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.alternate_email_rounded),
                            hintText: "Email",
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter min. 6 characters '
                            : null,
                        controller: _passwordController,
                        style: TextStyle(),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            hintText: "Password",
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ElevatedButton(
                    onPressed: signUp,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF0B2E40),
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 135,
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: 'Already have an Account?',
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0B2E40)),
                      children: <TextSpan>[
                    TextSpan(
                      text: ' Sign in',
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    )
                  ]
                  ),
                  ),
            )
          ]
          ),
          )
    );
          
    
  }
}
    