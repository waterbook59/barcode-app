import 'package:barcodeapp/views/barcode_read/components/scan_start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
  Future<void> scanStart() async{
    final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    );
    print('barcodeScanRes:$barcodeScanRes');
  }
}
