import 'package:adino/user.dart';
import 'package:flutter/material.dart';
import 'profile_card_draggable.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:adino/firebase.dart';

class CardsSectionDraggable extends StatefulWidget{

  CardsSectionDraggable();

  @override
  _CardsSectionState createState() =>  _CardsSectionState();
}

class _CardsSectionState extends State<CardsSectionDraggable>{
  
  _CardsSectionState();
  
  bool dragOverTarget = false;
 
  List<ProfileCardDraggable> cards = List();
  int showCounter = 0;
  int cardsCounter = 0;
  String category;
  String description;
  String imageUrl;
  String owner;
  String ownerName;
  


  @override
  void initState(){

    
    super.initState();
    
    for (cardsCounter = 0; cardsCounter <= 1; cardsCounter++){
      cards.add(ProfileCardDraggable(cardsCounter, "a", "b", "testOwner", "testOwnerName", null));
    }

    Firestore.instance.collection('products').snapshots()
    .listen((data) =>
      data.documents.forEach((doc){
        category = doc["category"];
        description = doc["description"];
        imageUrl = doc["imageUrl"];
        owner = doc["owner"];
        ownerName = doc["ownerName"];
        cards.add(ProfileCardDraggable(cardsCounter, category, description, owner, ownerName, imageUrl));
        cards.toSet().toList();
        cardsCounter++;
        print("Cards length: " + cards.length.toString());
      })
    );

    
  }


// StreamBuilder<QuerySnapshot> _retrieveProducts() {
  
//     return StreamBuilder<QuerySnapshot>(
//     // Interacts with Firestore (not CloudFunction)
//     stream: Firestore.instance.collection('products').snapshots(),
//     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       print("im called1");
//       if (!snapshot.hasData || snapshot.data == null) {
//         print("retrieve users do not have data.");
//         return Container(
//           child: Text("No data"),
//         );
//       }
//       print("im called2");
//       var docs = snapshot.data.documents;
      
//       // This ListView widget consists of a list of tiles 
//       // each represents a user.

//       for(var x = 0; x < snapshot.data.documents.length; x++ ){
//         cards.add(ProfileCardDraggable(x, docs[x]["category"], docs[x]["brand"], imageUrl));
//         cardsCounter++;
//         print(snapshot.data.documents[x]["brand"]);
//         print("x:" + x.toString());
        
//       }

      
//       return Container(width: 0.0, height: 0.0);
//     }
//   );
 
  
  
// }
  
  

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Stack(
        children: <Widget>[
          
          // Drag target row
          Row( 
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              dragTargetLeft(),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.grey.shade200,
                  
                )
              ),
              dragTargetRight()
            ],
          ),
          Align(
            child: IgnorePointer(child:  SizedBox.fromSize(
              size: Size(MediaQuery.of(context).size.width * 0.85, MediaQuery.of(context).size.height * 0.75),
              child: cards[((showCounter + 1) < cardsCounter?(showCounter+1):showCounter)],
            )),
          ),
          
          Align(
            //alignment:  Alignment(0.0, 0.0),
            child:  Draggable(
              feedback:  SizedBox.fromSize(
                size:  Size(MediaQuery.of(context).size.width * 1, MediaQuery.of(context).size.height * 0.8),
                child: cards[showCounter],
              ),
              child:  SizedBox.fromSize(
                size:  Size(MediaQuery.of(context).size.width * 1, MediaQuery.of(context).size.height * 0.8),
                child: cards[showCounter],
              ),
              childWhenDragging:  Container(),
            ),
          ),
          Align(
            alignment: Alignment(0.3, 0.849),
            child: Container(
              height: 50,
              width: 50,
              child: MaterialButton(
                child:  Icon(
                    Icons.cached,
                    color: Colors.black,
                    size: 30.0,
                  ),
                onPressed: (){
                  setState(() {
                    showCounter = 0;  
                  });
                },
              ),
            ),
          ),
          
        ],
      )
    );
  }

  void changeCardsOrder(){
    setState((){
      if(showCounter < cardsCounter - 1){
        
        ++showCounter;
        print(showCounter.toString() + " showCounter");
      } else return;
    });
  }

  Widget dragTargetLeft(){
    return  Flexible(
      flex: 1,
      child:  DragTarget(
        builder: (_, __, ___){
          return  Container(color: Colors.grey.shade200,);
        },
        onWillAccept: (_){
          setState(() => dragOverTarget = true);
          return true;
        },
        onAccept: (_){
          changeCardsOrder();
          print(cardsCounter.toString() + " cards counter");
          print("left");
          print(cards[showCounter].ownerName);
          setState(() => dragOverTarget = false);
        },
        onLeave: (_) => setState(() => dragOverTarget = false)
      ),
    );
  }
  Widget dragTargetRight(){
    return  Flexible(
      flex: 1,
      child:  DragTarget(
        builder: (_, __, ___){
          return  Container(color: Colors.grey.shade200,);
        },
        onWillAccept: (_){
          setState(() => dragOverTarget = true);
          return true;
        },
        onAccept: (_){
          changeCardsOrder();
          print(cardsCounter.toString() + " cards counter");
                    print("right");
          print(cards[showCounter].owner);
          // firebase.db.collection("users").document(appUser.user.id).updateData({
          //     "matching": FieldValue.arrayUnion([cards[showCounter].owner])
          //   }
          // );
          firebase.db.collection("users").document(appUser.user.id).collection("matching").add({
            "id": cards[showCounter].owner,
            "name": cards[showCounter].ownerName
            }
          );
          setState(() => dragOverTarget = false);
        },
        onLeave: (_) => setState(() => dragOverTarget = false)
      ),
    );
  }
}