import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
      image: 'https://th.bing.com/th/id/R.b758b97ea8dcff63ab3f3d657193c378?rik=7XOMqL7dIXEf2Q&riu=http%3a%2f%2faceaccountants.co.uk%2fwp-content%2fuploads%2f2018%2f11%2fConstruction-Industry-1.jpg&ehk=oM%2foBCpGlKv2HjGUdqoygK%2bqyiMYKGs1Tt1Z9UYMKpw%3d&risl=&pid=ImgRaw&r=0',
      title: 'High Quality',   
      index: 0,
      
    ),
    CardItem(
      image: 'https://th.bing.com/th/id/R.2562cb2d6aed519dfb9b2efd2061a2e6?rik=ol4hOJJC5mFuFQ&pid=ImgRaw&r=0',
      title: 'Meduim Quality',   
      index: 1,
    ),
    CardItem(
      image: 'https://burnswhite.com/wp-content/uploads/2020/03/Construction-Law-scaled.jpg', 
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
      //backgroundColor: Colors.grey[300],
       appBar: AppBar(
            centerTitle: true,
            title: Text(
              'House Cost Caculator',
              style:TextStyle(
                color: Color.fromARGB(255, 28, 38, 123),
                fontWeight: FontWeight.bold,
              ) ,

            ),
            backgroundColor: Colors.transparent,
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
                  child: Text("Let's Calculate the cost of your house",
                  style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(170, 148, 19, 120)
                  
              ),

              ),
                ),
                Container(
                  child: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_qcrbuch7.json"),

                  ),

                  SizedBox(height: 20,),

                
            Container(
               padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
             child: Center(
               child: Text("Choose the Quality of the House",
               style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
                 color: Color.fromARGB(170, 148, 19, 120)
               ),
               ),
             ),

            ),
              SizedBox(height: 20,),

              
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
