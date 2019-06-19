import 'package:adino/user.dart';
import "package:flutter/material.dart";
import '../utils/cards_section_draggable.dart';
import 'add_product_page.dart';
import 'user_page.dart';
import 'add_product_list.dart';
import '../utils/tab_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adino/product.dart';
import 'expPage.dart';
import 'package:cloud_functions/cloud_functions.dart';


class MarketPage extends StatefulWidget {
  final Widget child;
  GoogleSignInAccount user;
  GoogleSignIn googleSignIn;

  
  
  MarketPage({Key key, this.child, this.user, this.googleSignIn}) : super(key: key);

  _MarketPageState createState() => _MarketPageState(user, googleSignIn);
}

class _MarketPageState extends State<MarketPage> {

  final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
    functionName: 'readUser',
  );

  int showCounter = 0;
  CardsSectionDraggable cardSection = new CardsSectionDraggable();

  Firestore db = Firestore.instance;
  _MarketPageState(this.user, this.googleSignIn){
    print(googleSignIn);
    product.owner = user.id;
    product.ownerName = user.displayName;
    
    appUser.user = user;
    appUser.googleSignIn = googleSignIn;
  }
  GoogleSignInAccount user;
  GoogleSignIn googleSignIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Builder(
          builder: (context) => Column(           
          children: <Widget>[
          Container(   
            color: Colors.white,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage(user: user, googleSignIn: googleSignIn)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top:20.0, left: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.perm_identity,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(
                            child: Text("Adino", 
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  shape:  CircleBorder(),
                  padding: const EdgeInsets.all(0.0),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DTabController()));
                  },
                  child:  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                )
              ],
            )
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.white,
            child: RawMaterialButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("FILTER", style: TextStyle(fontSize: 15,color: Colors.black)),
                  Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 15.0,
                    ),
                ],
              ),
              onPressed: (){},
            ),
          ),
          cardSection,
          Container(
            color: Colors.grey.shade200,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    
                  },
                  child:  Icon(
                    Icons.cached,
                    color: Colors.grey[300],
                    size: 30.0,
                  ),
                ),
                RawMaterialButton(
                  fillColor:Color(0xFFcc805e),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductList()));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  shape:  CircleBorder(),
                  padding: const EdgeInsets.all(0.0)
                ),
                MaterialButton(
                  onPressed: () {
                    callable.call();

                    print('CF on.');
                  },
                  child: Text("ExpPage"),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Item added to your favourites!"),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            Scaffold.of(context).removeCurrentSnackBar();
                          }
                        )
                      )
                    );
                  },
                  child: Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )
    );
  }
}