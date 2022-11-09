 import 'package:cloud_firestore/cloud_firestore.dart';

class materials{
  final  String? name;
  final int? price;
    materials(
      {required this.name, required this.price});

      factory materials.fromSnapshot(DocumentSnapshot snap){
        var snapshot = snap.data() as Map<String, dynamic>;
        return materials(
          name: snapshot['name'],
          price: snapshot['price'],
      
        );
      }
 
 Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };
  }