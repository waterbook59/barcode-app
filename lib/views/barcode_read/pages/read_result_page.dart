import 'package:barcodeapp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar:  AppBar(title: const Text('スキャン結果'),),
      body:SingleChildScrollView(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              Text(widget.barcodeScanRes,style: barcodeReadTextStyle,),
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
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  decoration: const InputDecoration(hintText:'期限を入力',),
                  controller: widget._textEditingController,
                  onTap:(){
                    // キーボードが出ないようにする
                    FocusScope.of(context).requestFocus(new FocusNode());
                    showPicker();

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //テキストフィールドを押すとpicker立ち上がる
  void showPicker() {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return Column(
              mainAxisAlignment:MainAxisAlignment.end,
              children: <Widget>[
          Container(decoration: BoxDecoration(
              color: Color(0xffffffff),
          border: Border(
          bottom: BorderSide(color: Color(0xff999999),width: 0.0,),),
          ),
          child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
          /// クパチーノデザインのボタン表示
          CupertinoButton(child: Text('キャンセル'),
          onPressed: () {
          Navigator.pop(context);
          },
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5.0,),
          ),
          CupertinoButton(child: Text('追加'),
          onPressed: () {
          Navigator.pop(context);
          },
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5.0,),
          )
          ],),
          ),
          /// 最下部で表示するPicker(widge分割したものにpickerを引数として渡す)
                 _bottomPicker(
          CupertinoDatePicker(
          /// datePickerを日付のみの表示にする
            mode: CupertinoDatePickerMode.date,
            initialDateTime: widget._dateTime,
            onDateTimeChanged:
            (DateTime newDateTime) {
            setState(() =>
            widget._dateTime = newDateTime);
            //選択したものを表示
            widget._textEditingController.text=newDateTime.toIso8601String();
          },
          ),
                 ),
          ]);
        }
    );
  }
}

/// datePickerの表示構成
Widget _bottomPicker(Widget picker) {
  return Container(
    height: 216,
    padding: const EdgeInsets.only(top: 6),
    color: CupertinoColors.white,
    child: DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.black,
        fontSize: 22,
      ),
      child: GestureDetector(
        onTap: () {},
        child: SafeArea(
          top: false,
          child: picker,
        ),
      ),
    ),
  );
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

    }
    );
  }
//年月日picker
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


//  }

