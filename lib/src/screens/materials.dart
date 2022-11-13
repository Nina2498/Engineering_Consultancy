
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
        centerTitle: true,
            title: Text(
              'Materials',
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
      //reading the data from cloud firestore and displaying it in a list view
      body: Column(
        children: [
          Container(
              color: Colors.blue[50],
              child: ListTile(
                title: Text('Items',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 28, 38, 123),
                    )),
                trailing: Text('Prices',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 28, 38, 123),
                    )), 
              )),
          Expanded(
              child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('materials').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    .map((e) =>
                        {'id': e.id, 'name': e['name'], 'price': e['price']})
                    .toList();

                t = ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Get the item at this index
                      Map thisItem = items[index];
                      //REturn the widget for the list items
                      return Column(children: [
                        // color: Colors.blue[50],
                        ListTile(
                          title: Text('${thisItem['name']}'),
                          trailing: Text('${thisItem['price']}'),
                        )
                      ]);
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
          )),
          //  Text('a'),
        ]));
  }
}