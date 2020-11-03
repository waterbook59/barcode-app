import 'package:barcodeapp/style.dart';
import 'package:flutter/material.dart';

class CameraIconPart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:  Border.all(color: Colors.blueAccent),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 80,
          height: 80,
          //todo タップでカメラ起動 or 保存先から選択
          child: Image.asset(cameraIcon),
        ),
      ),
    );
  }
}
