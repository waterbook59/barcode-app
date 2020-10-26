import 'package:barcodeapp/views/barcode_read/components/bottom_picker.dart';
import 'package:flutter/cupertino.dart';

class ValidDatePicker extends StatelessWidget {
  const ValidDatePicker({
    this.dateTime, this.textEditingController,this.dateChanged});

  final DateTime dateTime;
  final TextEditingController textEditingController;
  final ValueChanged<DateTime> dateChanged;


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          border: Border(
            bottom: BorderSide(
              color: Color(0xff999999),
              width: 0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            /// クパチーノデザインのボタン表示
            CupertinoButton(
              child: const Text('キャンセル'),
              onPressed: () => Navigator.pop(context),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5,),
            ),
            CupertinoButton(
              child: const Text('追加'),
              onPressed: () => Navigator.pop(context),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5,),
            )
          ],
        ),
      ),

      /// 最下部で表示するPicker(widge分割したものにpickerを引数として渡す)
      BottomPicker(
        CupertinoDatePicker(

          /// datePickerを日付のみの表示にする
          mode: CupertinoDatePickerMode.date,
          initialDateTime: dateTime,
          onDateTimeChanged: dateChanged,
        ),),

//      bottomPicker(
//        CupertinoDatePicker(
//          /// datePickerを日付のみの表示にする
//          mode: CupertinoDatePickerMode.date,
//          initialDateTime: widget._dateTime,
//          onDateTimeChanged: (DateTime newDateTime) {
//            setState(() => widget._dateTime = newDateTime);
//            //選択したものを表示
//            widget._textEditingController.text = newDateTime.toIso8601String();
//          },
//        ),
//      ),
    ]);
  }
}