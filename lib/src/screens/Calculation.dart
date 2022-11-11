import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/HQCal.dart';
import 'package:personal_project/src/screens/LQCal.dart';
import 'package:personal_project/src/screens/MQCal.dart';



class CardItem {
  String title;
  String image;
  int index;
  CardItem({
    required this.title, 
    required this.image,
    required this.index,
});
}

class HouseDetails extends StatefulWidget {
  HouseDetails({Key? key}) : super(key: key);

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {

  List<CardItem> items = [
    CardItem(
      image: 'https://scontent.fbgw4-4.fna.fbcdn.net/v/t1.6435-9/71577598_938620226498419_4248847370239868928_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=TyIDlQxDAW4AX-3m-5S&_nc_ht=scontent.fbgw4-4.fna&oh=00_AfAW6HSZGZvTPEFXhCCVTPWot_w_tkFyuHhqY_6oyoVJmg&oe=6391C84C',
      title: 'High Quality',   
      index: 0,
      
    ),
    CardItem(
      image: 'https://scontent.fbgw4-4.fna.fbcdn.net/v/t1.6435-9/71577598_938620226498419_4248847370239868928_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=TyIDlQxDAW4AX-3m-5S&_nc_ht=scontent.fbgw4-4.fna&oh=00_AfAW6HSZGZvTPEFXhCCVTPWot_w_tkFyuHhqY_6oyoVJmg&oe=6391C84C',
      title: 'Meduim Quality',   
      index: 1,
    ),
    CardItem(
      image: 'https://scontent.fbgw4-4.fna.fbcdn.net/v/t1.6435-9/71577598_938620226498419_4248847370239868928_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=TyIDlQxDAW4AX-3m-5S&_nc_ht=scontent.fbgw4-4.fna&oh=00_AfAW6HSZGZvTPEFXhCCVTPWot_w_tkFyuHhqY_6oyoVJmg&oe=6391C84C', 
      title: 'Low Quality',
      index: 2,
    ),
  ];

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _qualityController = TextEditingController();
  final TextEditingController _numberoffloController = TextEditingController();
   String resulttext = "0";
   int Quality = 0;
  

  @override

  Widget build(BuildContext context) {
    var dropdownValue;
    return Scaffold(
      backgroundColor: Colors.grey[300],
       appBar: AppBar(
            centerTitle: true,
            title: Text(
              'House Cost Caculator',
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
                Navigator.of(context).pop();
              },
            ),
          ),
        body: Column(
         
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Text("General Calculation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(170, 148, 19, 120)
                
              ),
              ),
            ),
                // Area
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 250, 0),
                  child: Text("Area of the House",
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
                  margin: EdgeInsets.fromLTRB(10, 0, 240, 0),
                  child: Text("Quality of the House",
                   style: TextStyle(
                   color: (Color.fromARGB(170, 148, 19, 120)),
                   fontSize: 15,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.only(right: 200),
                      child: DropdownButton(
                        hint: Text('Choose Quality'),
                        value: dropdownValue,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            Quality = int.parse(newValue.toString());
                          });
                        },
                  items: [
                    DropdownMenuItem(
                      child: Text('High'),
                      value: 300,
                    ),
                    DropdownMenuItem(
                      child: Text('Medium'),
                      value: 250,
                    ),
                    DropdownMenuItem(
                      child: Text('Low'),
                      value: 200,
                    ),
                  ],
                ),
              ),

                //Number of Floors
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 170, 0),
                  child: Text("Number of Floors of the House",
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
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 30, 10),
                child: ElevatedButton(
                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(170, 148, 19, 120))
                              ),
                              
                  child: Text("Calculate"),
                  onPressed : () {
                    setState(() {
                      // int result = int.parse(_areaController.text) * int.parse(Quality.text) *int.parse(_numberoffloController.text);
                      // resulttext = result.toString();
                      int result = int.parse(_areaController.text) * Quality *int.parse(_numberoffloController.text);
                      resulttext = result.toString();
                    });
                  },
                ),
              ),
                 Text("Result:",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 28, 38, 123),
                ),),
               new Text(resulttext,
                 style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 28, 38, 123),
               ),
               ),
              
              ],
          
            ),   

              Container(
                 
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Text("Detailed Calculation",
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(170, 148, 19, 120)
                  
              ),
              ),
                ),
            Container(
              height: 256,
              child: ListView.separated(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemBuilder:(context, index ) => buildCard(item: items[index]),
               
              ),
            ),
            
    ]
    )
    );

    
  }
    Widget buildCard({
    required  CardItem item,
    }) 
=>
     Container(
      width: 200,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4/3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  child: Ink.image(
                    image: NetworkImage(item.image),
                     fit: BoxFit.cover,
                     child: InkWell(
                      onTap: (){
                      
                        if(item.index==0){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => calculation()));
                        }
                        else if(item.index==1){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MQCal()));
                        }
                        else if(item.index==2){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LQcal()));
                        }
                      }
                     ),
                ),
              ),
            ),
            ),
          ),
            const SizedBox(height: 10),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 28, 38, 123),
              ),
            ),
        ],
      )
     // color: Color.fromARGB(255, 28, 38, 123),
    );
}
