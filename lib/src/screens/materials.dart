
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Materials extends StatefulWidget {
  Materials({Key? key}) : super(key: key);

  @override
  State<Materials> createState() => _MaterialsState();
}

var t;

class _MaterialsState extends State<Materials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materials'),
      ),

      //reading the data from cloud firestore and displaying it in a list view
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('materials')
        .orderBy("price", descending: true)
        .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot<Object?>? querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot!.docs;

            //Convert the documents to Maps
            List<Map> items = documents
                .map(
                    (e) => {'id': e.id, 'name': e['name'], 'price': e['price']})
                .toList();

            t = ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //REturn the widget for the list items
                  return Container(
                      color: Colors.blue[50],
                      child: ListTile(
                        title: Text('${thisItem['name']}'),
                        trailing: Text('${thisItem['price']}'),
                      ));
                });
          }
          return t;
          /* return ListView(
            children: snapshot.data!.docs.map((document) {
              return ListTile(
                title: Text(document['name']),
                trailing: (document['price']),
              );
            }).toList(),
          );
          */
        },
      ),
    );
  }
}
