import 'package:adino/pages/market_page.dart';
import 'package:flutter/material.dart';
import 'package:adino/user.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:adino/firebase.dart';
import 'package:adino/product.dart';

class AddImagePage extends StatefulWidget {
  @override
  _AddImagePageState createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {

  static File _image;

  static Widget placeholderImage = Image.network(
    "https://carepharmaceuticals.com.au/wp-content/uploads/sites/19/2018/02/placeholder-600x400.png",
    fit: BoxFit.cover,
  );

  Future getImage() async {
    setState(() {
      _image = null;
    });
    final File tempImage = await showDialog<File>(
      context: context,
      builder: (ctx) => SimpleDialog(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Take a picture"),
            onTap: () async {
              File tempImage = await ImagePicker.pickImage(source: ImageSource.camera);
              Navigator.pop(ctx, tempImage);
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text("Pick from gallery"),
            onTap: () async {
              File tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
              Navigator.pop(ctx, tempImage);
            },
          )
        ],
      )
    );

    	setState(() {
        _image = tempImage;
        firebase.uploadImage(_image);
	  	});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Picture"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.width,
            child: (_image == null) ? placeholderImage : 
                      SizedBox.expand(
                        child: Image.file(_image, fit: BoxFit.fill),
                      )
          ),
          Container(
            child: Column(
              children: <Widget>[
                MaterialButton(
                  onPressed: getImage,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_a_photo,
                          color: Colors.grey,
                          size: 30
                        ),
                        SizedBox(width: 10),
                        Text((_image == null) ? "Add Picture" : "Change Picture",
                          style: TextStyle(
                            fontSize: 24
                          ),
                        ),
                      ],
                    ),
                ),
                SizedBox(height: 75),
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
                      firebase.uploadData();
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MarketPage(user: appUser.user, googleSignIn: appUser.googleSignIn)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("SUBMIT",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.check)
                      ],
                    )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}