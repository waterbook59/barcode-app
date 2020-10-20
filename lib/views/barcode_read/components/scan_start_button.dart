import 'package:barcodeapp/style.dart';
import 'package:flutter/material.dart';

class ScanStartButton extends StatelessWidget {
  const ScanStartButton({this.onPressed,this.label,this.fontSize});
  final VoidCallback onPressed;
  final String label;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: RaisedButton(
          onPressed: onPressed,
          child: Text(label,
              style: TextStyle(fontFamily: boldFont,fontSize: fontSize)),
        ),
      ),
    );
  }
}
