import 'package:barcodeapp/views/barcode_read/components/scan_start_button.dart';
import 'package:flutter/material.dart';

class BarcodeReadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('バーコード読み取り',
        style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
              child:ScanStartButton(
                onPressed: scanStart,
                label: 'Scan!!!',
                fontSize: 18,
              )
            ),
        ),
    );
  }

  //todo 押したらリーダー立ち上げて読み取り
  void scanStart() {
  }
}
