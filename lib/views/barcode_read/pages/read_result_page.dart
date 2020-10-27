import 'package:barcodeapp/style.dart';
import 'package:barcodeapp/views/barcode_read/components/picker_form_part.dart';
import 'package:barcodeapp/views/barcode_read/components/valid_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReadResultPage extends StatefulWidget {
  ReadResultPage({this.barcodeScanRes});

  final String barcodeScanRes;
  TextEditingController _textEditingController = TextEditingController();
  DateTime _dateTime = DateTime.now();

  @override
  _ReadResultPageState createState() => _ReadResultPageState();
}

class _ReadResultPageState extends State<ReadResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スキャン結果'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                widget.barcodeScanRes,
                style: barcodeReadTextStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              PickerFormPart(
                onCancelButtonPressed: (){
                  setState(() {
                    widget._textEditingController.clear();
                  });
                },
                dateEditController: widget._textEditingController,
                dateTime: widget._dateTime,
                dateChanged: (newDateTime){
                  setState(() {
                    widget._dateTime = newDateTime;
                    //intlパッケージを使ってpickerで選択した年月日を日本語表示
                    widget._textEditingController.text =
                        DateFormat.yMMMd('ja').format(newDateTime).toString();
                  });
                },
              ),
              const SizedBox(
                height: 40,
              ),
              RaisedButton(
                child: const Text('Pickerを表示！'),
                onPressed: () => showBottomPicker(context),
              ),
              const SizedBox(
                height: 40,
              ),
              RaisedButton(
                child: const Text('年月日Pickerを表示！'),
                onPressed: () => showDeadlinePicker(context),
              ),



            ],
          ),
        ),
      ),
    );
  }


}


//stateless
//class ReadResultPage extends StatelessWidget {
//
//   ReadResultPage({this.barcodeScanRes});
//  TextEditingController _textEditingController = TextEditingController();
//  final String barcodeScanRes;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar:  AppBar(title: const Text('スキャン結果'),),
//      body:SingleChildScrollView(
//        child: Center(
//          child:Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Text(barcodeScanRes,style: barcodeReadTextStyle,),
//              const SizedBox(height: 40,),
//              RaisedButton(
//                child: const Text('Pickerを表示！'),
//                onPressed: ()=>showBottomPicker(context),
//              ),
//              const SizedBox(height: 40,),
//              RaisedButton(
//                child: const Text('年月日Pickerを表示！'),
//                onPressed: ()=>showDeadlinePicker(context),
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  hintText: '賞味期限を入力'
//                ),
//                controller: _textEditingController,
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//ただのpicker
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
      });
}

//年月日picker
void showDeadlinePicker(BuildContext context) {
  showCupertinoModalPopup<dynamic>(
      context: context,
      builder: (context) {
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

//  }
