import 'package:flutter/material.dart';
import 'package:personal_project/src/screens/HouseInfo.dart';
import 'package:personal_project/src/screens/houseData.dart';

class samples extends StatefulWidget {
  samples({Key? key}) : super(key: key);

  @override
  State<samples> createState() => _samplesState();
}

class _samplesState extends State<samples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 197, 197),
       appBar: AppBar(
            centerTitle: true,
            
          
            title: Text(
              'Sample of Completed Projects',
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
           body:Column(
            children: [
              Container(
                //color: Color.fromARGB(255, 51, 88, 151),
                height: 722,
                child: ListView.builder(
                  itemCount: listofHouses.length,
                  itemBuilder: (context, index){
                  
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: InkWell
                      (
                   onTap: () {
                     Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>HouseInfo(
                                    imageURL: listofHouses[index]["image"].toString(),
                                      nameCity: listofHouses[index]["id"].toString(),
                                      info: listofHouses[index]["text"].toString(),


                                                ),

                                                )
                     );
                   },
                            child: Stack(
                             children: <Widget>[
                             Container(
                               child: Image.network(listofHouses[index]
                               ["image"].toString()),
                               height: 250,
                               width: double.infinity,
                              
                             ),

                           
                    
                    Container(
                     margin: EdgeInsets.only(top: 220),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Color.fromARGB(255, 114, 118, 123),
                     borderRadius: BorderRadius.circular(35)),
                
                  child: Text(listofHouses[index]["id"].toString(), 
                              style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold, 
                               fontSize: 24),),),
            ]
                     
                     ) 
                     )
                     ); 
                      
                  }
                )
           ),

           
 
            ]
    )
    
    );
            
          }
        }