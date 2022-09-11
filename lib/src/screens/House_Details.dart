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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(40),
                  child: Text("Area",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,

                  ),),

                )
              ],
            ),
             Row(
              children: [
                Container(
                   margin: EdgeInsets.all(40),
                  child: Text("Quality",
                  style: TextStyle(
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                  ),

                ),
              ],
            ),
            Row(
              children: [
                Container(
                   margin: EdgeInsets.all(40),
                  child: Text("Number of Floors",
                  style: TextStyle(
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                    ),

                )
              ],
            ),
             Row(
              children: [
                Container(
                   margin: EdgeInsets.all(50),
                  child: Text("Result",
                  style: TextStyle(
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                    ),

                )
              ],
            ),
             
           ],
            ),
        
          
    );
  }
}