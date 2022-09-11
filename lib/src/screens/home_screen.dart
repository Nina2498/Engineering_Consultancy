import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Card dashboardItems(String title, String img, int index){
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),

            ),

          ],
        ),
        child: InkWell(
          onTap: () {
            if(index==0){
              //first item
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
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child:Text(title, 
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
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
                dashboardItems("Home", img, 0)
              ],
            )
        ],

      )
         
      
    );
  }
}