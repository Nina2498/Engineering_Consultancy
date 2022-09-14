import 'package:flutter/material.dart';

class HouseDetails extends StatefulWidget {
  HouseDetails({Key? key}) : super(key: key);
  //  int? Area;
  //  int? Quality;
  //  int? NumberOfFloors; 
  //  int? result;

  
  

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _qualityController = TextEditingController();
  final TextEditingController _numberoffloController = TextEditingController();
  

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("House Cost Estimation"),
        backgroundColor: Color.fromARGB(255, 63, 58, 58),
        centerTitle: true,
        ),
        body: Column(
         
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //the form 
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.fromLTRB(100, 10, 100, 5),
              child: Text("Fill Out the Form",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            // Area
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 250, 0),
                  child: Text("Write the Area ",
                   style: TextStyle(
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.fromLTRB(15,5,100,5),
                  child: TextField(
                    controller: _areaController,
                    decoration: InputDecoration(
                      hintText: "Area",
                      border: OutlineInputBorder(),

                    ),

                  ),
                ),
                //Quality 
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 250, 0),
                  child: Text("Write the Quality",
                   style: TextStyle(
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.fromLTRB(15,5,100,5),
                  child: TextField(
                  controller: _qualityController,
                    
                    decoration: InputDecoration(
                      hintText: "Quality",
                      border: OutlineInputBorder(),

                    ),

                  ),
                ),

                //Number of Floors
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 210, 0),
                  child: Text("Write Number of Floors",
                   style: TextStyle(
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.fromLTRB(15,5,100,5),
                  child: TextField(
                    controller: _numberoffloController,
                    decoration: InputDecoration(
                      hintText: "Floors",
                      border: OutlineInputBorder(),

                    ),

                  ),
                ),
                

                
              ],
          
            ),
        
          
    );
  }
}

