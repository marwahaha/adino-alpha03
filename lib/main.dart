import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'authentication.dart';
import 'pages/market_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adino',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Champ1"
      ),
      home: LoginPage(),
		);
  }
}

