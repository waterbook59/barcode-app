import 'package:barcodeapp/data_models/product.dart';
import 'package:barcodeapp/style.dart';
import 'package:barcodeapp/view_models/read_result_view_model.dart';
import 'package:barcodeapp/views/read_result/components/imgae_from_url.dart';
import 'package:barcodeapp/views/read_result/components/picker_form_part.dart';
import 'package:barcodeapp/views/read_result/components/valid_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReadResultPage extends StatefulWidget {
  ReadResultPage({this.barcodeScanRes});

  final String barcodeScanRes;
  TextEditingController _textEditingController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  String _productName ='';
  String _productUrl='';

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
                height: 30,
              ),

              Text('JANコード:${widget.barcodeScanRes}',
                style: barcodeReadTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: const Text('Pickerを表示！'),
                onPressed: () => showBottomPicker(context),
              ),
//              const SizedBox(
//                height: 10,
//              ),
//              RaisedButton(
//                child: const Text('年月日Pickerを表示！'),
//                onPressed: () => showDeadlinePicker(context),
//              ),
              const SizedBox(
                height: 40,
              ),
              RaisedButton(
                color: Colors.cyan,
                child: const Text('JANコードを送信！！！'),
                onPressed: () =>
                    getProductInfo(context, widget.barcodeScanRes,),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width:80,
                  height: 80,
                  child: ImageFromUrl(imageUrl: widget._productUrl,)),
              const SizedBox(
                height: 20,
              ),
              Text('商品名:${widget._productName}',
                style: barcodeReadTextStyle,
              ),
              PickerFormPart(
                onCancelButtonPressed: () {
                  setState(() {
                    widget._textEditingController.clear();
                  });
                },
                dateEditController: widget._textEditingController,
                dateTime: widget._dateTime,
                dateChanged: (newDateTime) {
                  setState(() {
                    widget._dateTime = newDateTime;
                    //intlパッケージを使ってpickerで選択した年月日を日本語表示
                    widget._textEditingController.text =
                        DateFormat.yMMMd('ja').format(newDateTime).toString();
                  });
                },
              ),



            ],
          ),
        ),
      ),
    );
  }

  Future<void> getProductInfo(BuildContext context,
      String barcodeScanRes) async {
    final viewModel = Provider.of<ReadResultViewModel>(context, listen: false);
    await viewModel.getProductInfo(barcodeScanRes);

    setState(() {
//      widget._product = viewModel.products[0];
      widget._productName= viewModel.products[0].name;
      //todo circularしか出ない・・・幅・サイズの問題？？
      widget._productUrl= viewModel.products[0].image;
      print('imageUrl:${ widget._productUrl}');
    });
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
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
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
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (value) => print(value),
            mode: CupertinoDatePickerMode.date,
          ),
        );
      });
}

//  }
