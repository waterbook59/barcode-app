
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeRepository{
  Future<String> scanStart() async{

    var barcodeResult='';
    try {
      barcodeResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeResult = 'Failed to get platform version.';
    }
    return barcodeResult;
  }

  }

