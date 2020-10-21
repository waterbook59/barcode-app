import 'package:barcodeapp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadResultPage extends StatelessWidget {

  const ReadResultPage({this.barcodeScanRes});
  final String barcodeScanRes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text('スキャン結果'),),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(barcodeScanRes,style: barcodeReadTextStyle,),
            const SizedBox(height: 40,),
            RaisedButton(
              child: const Text('Pickerを表示！'),
              onPressed: ()=>showBottomPicker(context),
            ),
          ],
        ),


      ),
    );
  }

  void showBottomPicker(BuildContext context) {
    showModalBottomSheet<dynamic>(
        context: context,
        builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: CupertinoPicker(
          itemExtent: 30,
          children: const [Text('aaa'), Text('bbb'), Text('ccc')],
        ),
      );

    }
    );
  }
}


//{
//showModalBottomSheet(
//context: context,
//builder: (BuildContext context) {
//return Container(
//height: MediaQuery.of(context).size.height / 3,
//child: CupertinoPicker(
//itemExtent: 30,
//children: [Text('aaa'), Text('bbb'), Text('ccc')],
//),