import 'package:flutter/material.dart';

class HouseDetails extends StatefulWidget {
  HouseDetails({Key? key}) : super(key: key);

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _qualityController = TextEditingController();
  final TextEditingController _numberoffloController = TextEditingController();
   String resulttext = "0";
  

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                    color: (Color.fromARGB(170, 148, 19, 120)),
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                    
                    ),
                  ),
                Container(
                  padding: EdgeInsets.fromLTRB(15,2,100,2),
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
                  margin: EdgeInsets.fromLTRB(0, 0, 200, 0),
                  child: Text("Write the Quality" 
                    " (Low:1000  Medium: 2000 High:3000 )",
                   style: TextStyle(
                   color: (Color.fromARGB(170, 148, 19, 120)),
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                Container(
                 padding: EdgeInsets.fromLTRB(15,2,100,2),
                  child: TextField(
                  controller: _qualityController,
                    
                    decoration: InputDecoration(
                      hintText: "Quality  ",
                      border: OutlineInputBorder(),

                    ),

                  ),
                ),

                //Number of Floors
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 210, 0),
                  child: Text("Write Number of Floors",
                   style: TextStyle(
                   color: (Color.fromARGB(170, 148, 19, 120)),
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
                Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              ElevatedButton(
              style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(170, 148, 19, 120))
                            ),
                            
                child: Text("Calculate"),
                onPressed : () {
                  setState(() {
                    int result = int.parse(_areaController.text) * int.parse(_qualityController.text) *int.parse(_numberoffloController.text);
                    resulttext = result.toString();
                  });
                },
              ),
                 Text("Result:",
                style: TextStyle(
                    fontSize: 30,
                ),),
               new Text(resulttext,
                 style: TextStyle(
                  fontSize: 30,
               ),
               ),
              ],
          
            ),


          //   Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text("Result:",
          //       style: TextStyle(
          //           fontSize: 30,
          //       ),),
          //      new Text(resulttext,
          //        style: TextStyle(
          //         fontSize: 30,
          //      ),
          //      ),
          //   ],
          // ),
        
          
    ]
    )
    );
  }
}

