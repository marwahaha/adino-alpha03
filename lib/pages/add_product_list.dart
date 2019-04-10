import 'package:flutter/material.dart';
import 'size_page.dart';

void main() => runApp(MaterialApp(home: AddProductList(), debugShowCheckedModeBanner: false,),);



class AddProductList extends StatefulWidget {
  @override
  _AddProductListState createState() => _AddProductListState();
}

class _AddProductListState extends State<AddProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Gender")),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
        Container(
          height: 150.0,
          width: double.infinity,
          color: Colors.grey[100],
          child: Center(
            child: Text("Where do you want to add your item?",
            style: TextStyle(fontSize: 16),),
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],        ),
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text("Female", textAlign: TextAlign.center,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListM()));  
            },
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],
        ),
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text("Male", textAlign: TextAlign.center,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListM()));  
            },
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],
        ),
      ],
    ),
    );
  }
}

class CategoryListM extends StatefulWidget {
  @override
  _CategoryListMState createState() => _CategoryListMState();
}

class _CategoryListMState extends State<CategoryListM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Category"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150.0,
            width: double.infinity,
            color: Colors.grey[100],
            child: Center(
              child: Text("Please select your item",
              style: TextStyle(fontSize: 16),),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],  
          ),
          Container(
            color: Colors.white,
            child: ExpansionTile(
              trailing: Text(""),
              title: Text("Clothes",
                textAlign: TextAlign.center,
              ),
              children: <Widget>[
                subCategory("Tops", context),
                subCategory("Knitwear", context),
                subCategory("Dresses", context),
                subCategory("Jumpsuits", context),
                subCategory("Trousers", context),
                subCategory("Trench coats", context),
                subCategory("Jeans", context),
                subCategory("Jackets", context),
                subCategory("Coats", context),
                subCategory("Leather Jackets", context),
                subCategory("Trench coats", context),
                subCategory("Shorts", context),
                subCategory("Skirts", context),
                subCategory("Swimwear", context),
                subCategory("Lingerie", context),
              ], 
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],  
          ),
          Container(
            color: Colors.white,
            child: ExpansionTile(
              trailing: Text(""),              
              title: Text("Bags",textAlign: TextAlign.center),
              children: <Widget>[
                subCategory("Clutch bags", context),
                subCategory("Handbags", context),
                subCategory("Backpacks", context),
                subCategory("Travel bags", context),    
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],  
          ),
          Container(
            color: Colors.white, 
            child: ExpansionTile(
              trailing: Text(""),
              title: Text("Shoes",textAlign: TextAlign.center),
              children: <Widget>[
                subCategory("Heels", context),
                subCategory("Ballet flats", context),
                subCategory("Trainers", context),
                subCategory("Flats", context),
                subCategory("Lace ups", context),
                subCategory("Boots", context),
                subCategory("Mules & clogs", context),
                subCategory("Ankle boots", context),
                subCategory("Espadrilles", context),
                subCategory("Sandals", context),  
              ],
            ),
          ),
          Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],  
          ),
          Container(
            color: Colors.white,
            child: ExpansionTile(
              title: Text("Accessories",textAlign: TextAlign.center),
              trailing: Text(""),
              children: <Widget>[
                subCategory("Watches ", context),
                subCategory("Belts", context),
                subCategory("Gloves", context),
                subCategory(" Wallets", context),
                subCategory("Hats", context),
                subCategory("Scarves", context),
                subCategory("Phone cases", context),
                subCategory("Purses", context),
                subCategory("Silk handkerchief", context),
                subCategory("Sunglasses", context),  
              ],
            )  
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],  
          ),
          Container(
            color: Colors.white,
            child: ExpansionTile(
              title: Text("Jewellery",textAlign: TextAlign.center),
              trailing: Text(""),
              children: <Widget>[
                subCategory("Ring", context),
                subCategory("Necklaces", context),
                subCategory("Earrings", context),
                subCategory("Pendants", context),
                subCategory("Sets", context),
                subCategory("Braclelets", context),
                subCategory("Charms", context),
                subCategory("Hair accessories", context),
                subCategory("Earrings", context),
                subCategory("Pin & brooches", context),
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],  
          ),
        ],
      ),
    );
  }
}

class CategoryListF extends StatefulWidget {
  @override
  _CategoryListFState createState() => _CategoryListFState();
}

class _CategoryListFState extends State<CategoryListF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Category"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150.0,
            width: double.infinity,
            color: Colors.grey[100],
            child: Center(
              child: Text("Please select your item",
              style: TextStyle(fontSize: 16),),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],        
          ),
          ExpansionTile(
            title: Text("Clothes",textAlign: TextAlign.center), 
              children: <Widget>[
                subCategory("Tops", context),
                subCategory("Knitwear", context),
                subCategory("Dresses", context),
                subCategory("Jumpsuits", context),
                subCategory("Trousers", context),
                subCategory("Trench coats", context),
                subCategory("Jeans", context),
                subCategory("Jackets", context),
                subCategory("Coats", context),
                subCategory("Leather Jackets", context),
                subCategory("Trench coats", context),
                subCategory("Shorts", context),
                subCategory("Skirts", context),
                subCategory("Swimwear", context),
                subCategory("Lingerie", context),
              ], 
            ),
          Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],  
          ),
            ExpansionTile(
              trailing: Text(""),
            title: Text("Bags",textAlign: TextAlign.center),
              children: <Widget>[
                subCategory("Clutch bags", context),
                subCategory("Handbags", context),
                subCategory("Backpacks", context),
                subCategory("Travel bags", context),
              ],
            ),
          Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],  
          ),
            ExpansionTile(
            title: Text("Shoes",textAlign: TextAlign.center),
              children: <Widget>[
                subCategory("Heels", context),
                subCategory("Ballet flats", context),
                subCategory("Trainers", context),
                subCategory("Flats", context),
                subCategory("Lace ups", context),
                subCategory("Boots", context),
                subCategory("Mules & clogs", context),
                subCategory("Ankle boots", context),
                subCategory("Espadrilles", context),
                subCategory("Sandals", context),
              ],
            ),
          Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],  
          ),
            ExpansionTile(
            title: Text("Accessories",textAlign: TextAlign.center),
              children: <Widget>[
                subCategory("Watches ", context),
                subCategory("Belts", context),
                subCategory("Gloves", context),
                subCategory(" Wallets", context),
                subCategory("Hats", context),
                subCategory("Scarves", context),
                subCategory("Phone cases", context),
                subCategory("Purses", context),
                subCategory("Silk handkerchief", context),
                subCategory("Sunglasses", context),
              ],
            ),
          Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],  
          ),
            ExpansionTile(
            title: Text("Jewellery",textAlign: TextAlign.center),
              children: <Widget>[
                subCategory("Ring", context),
                subCategory("Necklaces", context),
                subCategory("Earrings", context),
                subCategory("Pendants", context),
                subCategory("Sets", context),
                subCategory("Braclelets", context),
                subCategory("Charms", context),
                subCategory("Hair accessories", context),
                subCategory("Earrings", context),
                subCategory("Pin & brooches", context),
              ],
            ),
          Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],  
          ),
        ],
      ),
    );
  }
}
Widget subCategory(title, context){
  return Container(
    color: Colors.grey[200],
    child: ListTile(
      title: Text(title,textAlign: TextAlign.center,),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SizePage()));
      },
    ),
  );
}

Function a(BuildContext ctx){
  Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => SizePage()));
  return null;
}

