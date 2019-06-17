import 'dart:io';

class Product {

  String owner;
  String ownerName;

  String gender;
  String category;
  String size;
  String brand;
  String description;
  String condition;

  String pref1;
  String pref2;
  String pref3;

  String itemString;

  File image;

  Product();

  String toItemString(){
    itemString = gender + " " + category + " " + size + " " + brand + " " + description + " " + condition + " ";

    return itemString;
  }

}

Product product = Product();