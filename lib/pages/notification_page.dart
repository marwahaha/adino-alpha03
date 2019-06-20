import 'package:flutter/material.dart';
import 'package:adino/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adino/user.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _retrieveMatches()
      );
  }

  StreamBuilder<QuerySnapshot> _retrieveMatches() {

    return StreamBuilder<QuerySnapshot>(
      // Interacts with Firestore (not CloudFunction)
      stream: Firestore.instance.collection('recProducts').snapshots(),
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


  
  
}

// StreamBuilder<QuerySnapshot> _retrieveProducts() {

//     return new StreamBuilder<QuerySnapshot>(
//       // Interacts with Firestore (not CloudFunction)
//       stream: Firestore.instance.collection('products').snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           switch(snapshot.connectionState) {
//             case ConnectionState.waiting: 
//               return Center(child: CircularProgressIndicator());
//             default: 
//               return ListView.builder();
//           }
          

          
//         }
//     );
// }