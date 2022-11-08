import 'package:flutter/material.dart';

class HouseInfo extends StatelessWidget {
   const HouseInfo({Key? key, 
  required this.imageURL,
  required this.nameCity, 
  required this.info}) : super(key: key);

  final String imageURL;
  final String nameCity;
  final String  info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
       body: Column(children: [
        Image.network(imageURL),
        Text(nameCity, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(info, style: TextStyle(fontWeight:FontWeight.normal, fontSize: 25),),
          ),
        )    
      ]),
    );
  }
}