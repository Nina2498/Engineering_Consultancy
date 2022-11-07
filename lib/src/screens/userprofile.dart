import 'package:flutter/material.dart';

class userprofileScreen extends StatefulWidget {
  userprofileScreen({Key? key}) : super(key: key);

  @override
  State<userprofileScreen> createState() => _userprofileScreenState();
}

class _userprofileScreenState extends State<userprofileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: const Center(
        child: Text('User Profile'),
      ),
    
    );
  }
}