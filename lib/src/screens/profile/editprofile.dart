import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_project/src/models/user.dart';

class editprofile extends StatefulWidget {
  editprofile({Key? key}) : super(key: key);

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  final editnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
            title: Text(
              'Edit Profile',
              style:TextStyle(
                color: Color.fromARGB(255, 28, 38, 123),
                fontWeight: FontWeight.bold,
              ) ,

            ),
            backgroundColor: Color.fromARGB(255, 199, 197, 197),
            elevation: 0,
      ),
      body: Column(
        children: [
        

               Container(
                 child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('appusers').snapshots(),
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
                      
                        {'name': e['name']})
                    .toList();
                    editnamecontroller.text = "${items[0]['name']}";
              }
              return Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: editnamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              );
            },
          ),
          ),
          Row(
            //update the name
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('appusers')
                        .doc('1')
                        .update({'name': editnamecontroller.text});
                  },
                  child: Text('Update'),
                  style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 28, 38, 123),


                  ),
          ),
              ),
            ],
          ),  
      
        ],
        

    )
    );

}
}