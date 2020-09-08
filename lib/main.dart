//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
runApp(new MediaQuery(data:new  MediaQueryData(), child: new MaterialApp(home: new MyApp())));}

class MyApp extends StatelessWidget {
  final databaseReference = Firestore.instance;
  final myController = TextEditingController();
  final myDescription = TextEditingController();

  @override
  void dispose(){
    myController.dispose();

  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('FireStore Poc'),
     ),
     body: Center(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           TextField(
             controller: myController,
           ),
           TextField(
             controller: myDescription,
           ),
           RaisedButton(
             child: Text('Create Record'),
             onPressed: () {
               createRecord();
             }
           ),
           RaisedButton(
               child: Text('Get Record'),
               onPressed: () {
                 getData();
               }
           ),

         ],
       )
     ),
   );
  }




 void createRecord() async {
    /*await databaseReference.collection("email")
        .document("1")
        .setData({
        'title': 'test123@gmnail.com'
    });*/
    DocumentReference ref = await
        databaseReference.collection("email")
    .add({
          'title' : 'testgmail', // Text(myController.text),
          'description' : 'this for testing' // Text(myDescription.text),
        });
    DocumentReference refe = await
    databaseReference.collection("email")
        .add({
      'title' : '${myController.text}', //'test12@gmail.com',
      'description' :  '${myDescription.text}', //'test12'
    });
    print(ref.documentID);
    print(refe.documentID);
 }

 void getData(){
    databaseReference .collection("email")
        .getDocuments()
        .then((QuerySnapshot snapshot){
          snapshot.documents.forEach((f) => print('${f.data} }'));
    });
 }

}

