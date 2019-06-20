import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpPage extends StatefulWidget {
  @override
  _ExpPageState createState() => _ExpPageState();
}

class _ExpPageState extends State<ExpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fetchRec(),
    );
  }
}

StreamBuilder<DocumentSnapshot> fetchRec(){
  return StreamBuilder<DocumentSnapshot>(
    stream: Firestore.instance.collection('recProducts').document("rec").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading");
            }
            var userDocument = snapshot.data.data;
            var keys = userDocument.keys;
            List l = new List();

            for(var x=0 ; x < userDocument.length ; x++){
              l.add(userDocument[x.toString()]["content"]);
            }
            l.toSet().toList();
            print(l[1]);
            // return ListView(
            //   children: <Widget>[
                
            //        Text(
            //           userDocument["0"]["content"]
            //        )
                
            //   ],
            // );

            //print();

            return ListView.builder(
              itemCount: userDocument.length,
              itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){},
                    title: Text(l[index]),
                    // subtitle: Text(userDocument[keys[index]]["id"].toString()),
                  );
              }
            );
            // for(var x=0 ; x < userDocument.data.length ; x++){
            //   print(userDocument.data[x.toString()]["content"]);
            // }
            // print(userDocument.data.length);
            return Text("New");
            
          });}


  StreamBuilder<QuerySnapshot> _retrieveRecommended() {

    return StreamBuilder<QuerySnapshot>(
      // Interacts with Firestore (not CloudFunction)
      stream: Firestore.instance.collection('recProducts').document('rec').collection("").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting: 
              return Center(child: CircularProgressIndicator());
            default: 
              // if (!snapshot.hasData || snapshot.data == null) {
              //   print("retrieve users do not have data.");
              //   return Container();
              // } else {

              // }
              return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){},
                    title: Text(snapshot.data.documents[index]["name"]),
                    subtitle: Text(snapshot.data.documents[index]['id']),
                  );
              }
);
          }
          
          
        }
    );
}