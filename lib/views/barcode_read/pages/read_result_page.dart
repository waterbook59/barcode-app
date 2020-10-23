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
            const SizedBox(height: 40,),
            RaisedButton(
              child: const Text('年月日Pickerを表示！'),
              onPressed: ()=>showDeadlinePicker(context),
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

  void showDeadlinePicker(BuildContext context) {
    showCupertinoModalPopup<dynamic>(
        context: context,
        builder: (context){
          return Container(
            color: CupertinoColors.white,
            height: MediaQuery.of(context).size.height / 3,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (value) => print(value),
              mode: CupertinoDatePickerMode.date,
            ),
          );
        });
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