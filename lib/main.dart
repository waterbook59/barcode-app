import 'package:barcodeapp/style.dart';
import 'package:barcodeapp/view_models/barcode_read_view_model.dart';
import 'package:barcodeapp/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/providers.dart';

void main() {
  runApp(ChangeNotifierProvider<BarcodeReadViewModel>(
    create: (context)=>BarcodeReadViewModel(),
    child: MyApp(),
  ));
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

