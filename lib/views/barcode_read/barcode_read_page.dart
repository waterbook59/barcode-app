import 'package:barcodeapp/style.dart';
import 'package:flutter/material.dart';

class BarcodeReadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'バーコード読み取り',
           style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
              child: const Text(
            'BarcodeReadPage',
            style: TextStyle(fontFamily: boldFont),
          )),
        ),
      ),
    );
  }
}
