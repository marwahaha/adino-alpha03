import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adino/product.dart';
import 'package:adino/user.dart';

class Firebase {

  String _imageUrl;

  Firestore db = Firestore.instance;

  Firebase();

  Future<String> uploadImage(var imageFile) async {
    StorageReference ref = FirebaseStorage.instance.ref().child("${appUser.user.id}/photo.jpg");
    StorageUploadTask uploadTask = ref.putFile(imageFile);

    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    _imageUrl = dowurl.toString();
    return _imageUrl; 
  }

  bool uploadData() {
    db.collection("products").document().setData({
      "owner": product.owner,
      "ownerName": product.ownerName,
      "gender": product.gender,
      "category": product.category,
      "size": product.size,
      "brand": product.brand,
      "description": product.description,
      "condition": product.condition,
      "itemString": product.toItemString(),
      "imageUrl": _imageUrl
    });
    print(product.toItemString());
    // db.collection("products").document().setData({
    //   "category": product.category,
    //   "description":product.description,
    //   "pref1": product.brand,
    //   "pref2": product.brand,
    //   "pref3": product.brand,
    //   "userID": appUser.user.id,
    //   "imageUrl": appUser.user.id
    // });
  }
}

Firebase firebase = Firebase();