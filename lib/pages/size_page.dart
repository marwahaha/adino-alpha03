import 'package:flutter/material.dart';
import 'brand_page.dart';
import 'package:adino/product.dart';

class SizePage extends StatefulWidget {
  @override
  _SizePageState createState() => _SizePageState();
}

class _SizePageState extends State<SizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select size")),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150.0,
            width: double.infinity,
            color: Colors.grey[100],
            child: Center(
              child: Text("What's the size of your item?",
              style: TextStyle(fontSize: 16),),
            ),
          ),
          ListTile(
            title: Text("XS"),
            onTap: (){
              product.size = "xs";
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Brand()));
            },
          ),
          ListTile(
            title: Text("S"),
            onTap: (){
              product.size = "s";
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Brand()));
            },
          ),
          ListTile(
            title: Text("M"),
            onTap: (){
              product.size = "m";
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Brand()));
            },
          ),
          ListTile(
            title: Text("L"),
            onTap: (){
              product.size = "l";
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Brand()));
            },
          ),
          ListTile(
            title: Text("XL"),
            onTap: (){
              product.size = "xl";
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Brand()));
            },
          ),
          ListTile(
            title: Text("XXL"),
            onTap: (){
              product.size = "xxl";
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Brand()));
            },
          ),
        ],
      ) 
    );
  }
}