import 'package:barcodeapp/views/barcode_read/components/circle_icon_button.dart';
import 'package:barcodeapp/views/read_result/components/valid_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PickerFormPart extends StatelessWidget {
  VoidCallback onCancelButtonPressed;
  TextEditingController dateEditController;
  DateTime dateTime;
  ValueChanged<DateTime> dateChanged;

  PickerFormPart(
      {this.onCancelButtonPressed,
      this.dateEditController,
      this.dateTime,
      this.dateChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          alignment: const Alignment(1, 0), // right & center
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.dashboard),
                labelText: '期限',
                hintText: '期限を入力',
              ),
              controller: dateEditController,
              onTap: () {
                // キーボードが出ないようにする
                FocusScope.of(context).requestFocus(new FocusNode());

                ///テキストフィールドを押すと空の時は現在の日時を表示するようにする
                ///年月日が設定されている時はその年月日をCupertionDatePickerへ表示
                if (dateEditController.text.isEmpty) {
                  //dateTime(現在の時間)=>String(年月日表示)に変換してテキストコントローラーへ
                  dateEditController.text =
                      DateFormat.yMMMd('ja').format(DateTime.now()).toString();
                } else {
                  //String(テキストコントローラーの年月日表示)=>dateTimeに変換してpickerへ
                  dateTime = DateFormat.yMMMd('ja')
                      .parseStrict(dateEditController.text);
//                  print('dateTime:$dateTime');
                }

                //picker表示
                showPicker(context);
              },
            ),
            //todo キャンセルボタンはtextFieldタップ時だけ表示する
            CircleIconButton(
              onPressed: onCancelButtonPressed,
            ),
          ],
        ));
  }

  //テキストフィールドを押すとpicker立ち上がる
  void showPicker(BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return ValidDatePicker(
            dateTime: dateTime,
            textEditingController: dateEditController,
            dateChanged: dateChanged,
          );
        });
  }
}