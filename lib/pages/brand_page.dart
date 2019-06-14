import 'package:flutter/material.dart';
import 'preferences_page.dart';
import 'package:adino/product.dart';
import 'add_image_page.dart';

class Brand extends StatefulWidget {
  @override
  _BrandState createState() => _BrandState();
}

class _BrandState extends State<Brand> {

  int groupValue;

  _handleRadioButton(int e){
    setState(() {
      switch (e) {
        case 1: groupValue = 1;
        product.condition = "New";
        break;
        case 2: groupValue = 2;
        product.condition = "Good";
        break; 
        case 3: groupValue = 3;
        product.condition = "Fairly used";
        break;
        case 4: groupValue = 4;
        product.condition = "Very used";
        break;
        default:
      }
    }); 

    
  }

  final brandController = TextEditingController(); 
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Type brand")),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Brand",
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  controller: brandController,
                  maxLines: null,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: "Item brand"
                  ),
                  style:   TextStyle(color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 16.0), 
                  //onFieldSubmitted: (value) => _description = value,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Description", 
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  controller: descController,
                  maxLines: null,
                  maxLength: 150,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: "Write small description"
                  ),
                  style:   TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16.0), 
                  //onFieldSubmitted: (value) => _description = value,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Condition",
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(
                              onChanged: (int e) => _handleRadioButton(e),
                              value: 1,
                              groupValue: groupValue,
                              activeColor: Colors.black,
                            ),
                            Text("New",
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              onChanged: (int e) => _handleRadioButton(e),
                              value: 2,
                              groupValue: groupValue,
                              activeColor: Colors.black,
                            ),
                            Text("Good",
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(
                              onChanged: (int e) => _handleRadioButton(e),
                              value: 3,
                              groupValue: groupValue,
                              activeColor: Colors.black,
                            ),
                            Text("Fairly used",
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                            
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              onChanged: (int e) => _handleRadioButton(e),
                              value: 4,
                              groupValue: groupValue,
                              activeColor: Colors.black,
                            ),
                            Text("Very used",
                              style: TextStyle(
                                fontSize: 18
                              ),
                            )    
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Colors.grey[100],
                  Colors.grey[200],
                  Colors.grey[300],
                  Colors.grey[350],
                ],
              ),
            ),
            child: FlatButton(
              onPressed: (){
                product.brand = brandController.text;
                product.description = descController.text;
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AddImagePage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Next",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Icon(Icons.arrow_right)
                ],
              )
            ),
          ),
        ],
      ) 
    ); 
  }
}