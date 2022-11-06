import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/House_Details.dart';
import 'package:personal_project/src/screens/Login_screen.dart';
import 'package:personal_project/src/screens/adv_cal.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  
  Card dashboardItems(String title, String img, int index){
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0,-1.0 ),
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
              //navigate to the house details
              Navigator.push(context, MaterialPageRoute(builder: (context) => HouseDetails()));
            }
            if(index==1){
              //second item
              //navigate to advanced calculation 
             Navigator.push(context, MaterialPageRoute(builder: (context) => advcalculation()));
            }
            if(index==2){
              //third item
              //navigate to the sample of completed projects
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
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home"),
        backgroundColor: Color.fromARGB(255, 63, 58, 58),
        centerTitle: true,

      ),
      body: 
      Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    Text ("Construction Categories",
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
                crossAxisCount: 1,
                padding: const EdgeInsets.all(2),
                children: [
                  dashboardItems("Random Calculation","assets/images/home1.jpg", 0),
                  dashboardItems("Advanced Calculation","assets/images/building.jpg", 1),
                  dashboardItems("Samples","assets/images/restaurant.jpg", 2),
                ],
              ),

         ),
           
          ],
           
          
        ),
      ),
       
    );
  }
}