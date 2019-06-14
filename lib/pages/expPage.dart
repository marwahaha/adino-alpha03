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
      body: _retrieveProducts(),
    );
  }
}

StreamBuilder<QuerySnapshot> _retrieveProducts() {

    return new StreamBuilder<QuerySnapshot>(
      // Interacts with Firestore (not CloudFunction)
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            print("retrieve users do not have data.");
            return Container(
              child: Text("No data"),
            );
          }
          
          // This ListView widget consists of a list of tiles 
          // each represents a user.

          for(var x = 0; x < snapshot.data.documents.length; x++ ){
            print(snapshot.data.documents[x]["brand"]);
          }

          return Container(width: 0.0, height: 0.0);
        }
    );
}