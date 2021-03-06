import 'package:barcodeapp/style.dart';
import 'package:flutter/material.dart';

class CameraIconPart extends StatelessWidget {

  const CameraIconPart({this.onTap, this.displayImage});
  final VoidCallback onTap;
  final Widget displayImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:  Border.all(color: Colors.blueAccent),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 80,
            height: 80,
            //todo タップでカメラ起動 or 保存先から選択
            child: displayImage,
          ),
        ),
      ),
    );
  }
}
