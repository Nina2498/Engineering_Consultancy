import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/House_Details.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Card dashboardItems(String title, String img, int index){
    return Card(
      //elevation: 2,
      margin: const EdgeInsets.all(9),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(
            // begin: FractionalOffset(0.0, 0.0),
            // end: FractionalOffset(3.0,-1.0 ),
            colors:[ 
              Color.fromARGB(33, 106, 54, 158),
              Color.fromARGB(32, 241, 239, 244),

            ],
          ),
          boxShadow: const[
            BoxShadow(
              
              color: Color.fromARGB(255, 131, 71, 129),
               blurRadius: 3,
               offset: Offset(2, 2),

            ),

          ],
        ),
        child: InkWell(
          onTap: () {
            if(index==0){
              //first item
              Navigator.push(context, MaterialPageRoute(builder: (context) => HouseDetails()));
            }
            if(index==1){
              //second item
            }
            if(index==2){
              //third item
            }
            if(index==3){
              //fourth item
            }
            if(index==4){
              //fifth item
            }
            if(index==5){
              //sixth item
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  img,
                  height: 70,
                  width: 70,
                ),
              ),
              const SizedBox(
                height: 20
                
              ),
              Center(
                
                child:Text(title, 
                
                style: TextStyle(

                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),)
                ),
            ],
          ),
        ),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Color.fromARGB(255, 63, 58, 58),
        centerTitle: true,

      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Padding(padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text ("Building Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.bold, 
                  ),
                  ),
                ],
              )
            ],

          ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                dashboardItems("House","assets/images/home1.jpg", 0),
                dashboardItems("Building","assets/images/building.jpg", 1),
               dashboardItems("Restaurant","assets/images/restaurant.jpg", 2),
                dashboardItems("Villa","assets/images/villa.jpg", 3),
                dashboardItems("School","assets/images/school.jpg", 4),
                dashboardItems("Industry","assets/images/industry.jpg", 5),
                 
                //   dashboardItems("Home","assets/images/home1.jpg", 0),
              ],
            )
       ) ],

      )
         
      
    );
  }
}