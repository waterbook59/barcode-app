import 'package:barcodeapp/style.dart';
import 'package:barcodeapp/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: regularFont,
      ),
      home: HomeScreen(),
    );
  }
}

