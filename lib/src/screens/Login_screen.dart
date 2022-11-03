import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/app.dart';
import 'package:personal_project/src/models/user.dart';
import 'package:personal_project/src/screens/dashboard_screen.dart';
import 'package:personal_project/src/screens/forgetpassword.dart';
import 'package:personal_project/src/screens/register_screen.dart';
//import 'package:personal_project/src/services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.onClickSignUp}) : super(key: key);
  final VoidCallback onClickSignUp;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
     late final TextEditingController emailController;

  late final TextEditingController passwordController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // regular expression to check if string
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;

  // 0: No password
  // 1/4: Weak
  // 2/4: Medium
  // 3/4: Strong
  //   1:   Great

  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();

    if (_password.isEmpty) {
      setState(() {
        password_strength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        password_strength = 1 / 4;
      });
    } else if (_password.length < 8) {
      setState(() {
        password_strength = 2 / 4;
      });
    } else {
      if (pass_valid.hasMatch(_password)) {
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: const Color(0xFF0B2E40)),
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter a valid email'
                                    : null,
                            controller: emailController,
                            style: TextStyle(),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Enter min. 6 characters '
                                    : null,
                            controller: passwordController,
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                hintText: "Password",
                                ),
                          ),
                        ),
                      ),
                    ]),
              ),
              ListTile(
                trailing: TextButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ForgetPassword();
                          },
                        )),
                    style: TextButton.styleFrom(primary: Colors.blue),
                    child: Text(
                      "Forget Password",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ElevatedButton(
                      onPressed: () async {
                        final isvalid = formKey.currentState!.validate();
                        if (!isvalid) return;
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                        } on FirebaseAuthException catch (e) {
                          print(e);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF0B2E40),
                      ),
                      child: Text(
                        "SIGN IN",
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
                height: 230,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0B2E40)),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickSignUp,
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
