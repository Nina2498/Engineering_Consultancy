import 'package:flutter/material.dart';

class HouseDetails extends StatefulWidget {
  HouseDetails({Key? key}) : super(key: key);

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("House Cost Estimation"),
        backgroundColor: Color.fromARGB(255, 63, 58, 58),
        centerTitle: true,
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.fromLTRB(100, 10, 100, 5),
              child: Text("Fill Out the Form",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                

              ),
              ),
            ),
            Container(
              
            ),
          ]),
    );
  }
}