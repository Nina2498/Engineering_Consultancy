import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/materials.dart';
import 'package:personal_project/src/screens/House_Details.dart';
import 'package:personal_project/src/authentication/Login_screen.dart';
import 'package:personal_project/src/screens/adv_cal.dart';
import 'package:personal_project/src/screens/sampleOfCompletedProjects.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  
  Card dashboardItems(String title, String img, int index){
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(10),
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
              
              color: Colors.white70,
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => samples()));
            }
            if(index==3){
              //fourth item
              //navigate to the materials
              Navigator.push(context, MaterialPageRoute(builder: (context) => Materials()));
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
                  width: 80,
                ),
              ),
              const SizedBox(
                height: 20
                
              ),
              Center(
                
                child:Text(title, 
                
                style: TextStyle(

                  fontSize: 15,
                  color: Color.fromARGB(255, 91, 29, 102),
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
      //white color with opacity
      backgroundColor: Color.fromARGB(255, 199, 197, 197),
      
      
      body: 
      Center(
         
        //a text in the center of the screen
  
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Padding(padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    
                    
                      Text ("Categories",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight:FontWeight.bold, 
                        color: Color.fromARGB(255, 28, 38, 123),
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
                padding: const EdgeInsets.all(0),
                children: [
                  dashboardItems("General Calculation","assets/images/building.jpg", 0),
                  dashboardItems("Detailed Calculation","assets/images/eng.jpg", 1),
                  dashboardItems("Sample of Projects","assets/images/home1.jpg", 2),
                  dashboardItems("Materials", "assets/images/material.jpg", 3),
                ],
              ),

         ),
           
          ],
           
          
        ),
      ),
       
    );
  }
}