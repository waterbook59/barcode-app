import 'package:barcodeapp/views/common/components/circle_icon_button.dart';
import 'package:flutter/material.dart';

class ProductNamePart extends StatelessWidget {
  const ProductNamePart(
      {this.productNameController, this.onCancelButtonPressed});

  final TextEditingController productNameController;
  final VoidCallback onCancelButtonPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        alignment: const Alignment(1, 0), // right & center
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.dashboard),
              labelText: '商品名',
              hintText: '商品名を入力',
            ),
            controller: productNameController,
          ),
          //todo キャンセルボタンはtextFieldタップ時だけ表示する
          CircleIconButton(
            onPressed: onCancelButtonPressed,
          ),
        ],
      ),
    );
  }
}
