import 'package:barcodeapp/views/barcode_read/components/circle_icon_button.dart';
import 'package:barcodeapp/views/barcode_read/components/valid_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          alignment: const Alignment(1,0),// right & center
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: '期限を入力',
              ),
              controller: dateEditController,
              onTap: () {
                // キーボードが出ないようにする
                FocusScope.of(context).requestFocus(new FocusNode());
                showPicker(context);
              },
            ),
            CircleIconButton(
              onPressed: onCancelButtonPressed,
            ),
          ],
        ));
  }

  //テキストフィールドを押すとpicker立ち上がる=>widget分割
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
