import 'package:flutter/material.dart';

class ReadResultPage extends StatelessWidget {

  const ReadResultPage({this.barcodeScanRes});
  final String barcodeScanRes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text('スキャン結果'),),
      body:Center(child: Container(
        child: Text(barcodeScanRes),
      )) ,
    );
  }
}
