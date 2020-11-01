import 'dart:convert';

import 'package:barcodeapp/data_models/product.dart';
import 'package:barcodeapp/data_models/product_hits.dart';
import 'package:barcodeapp/models/model/products_info_model.dart';
import 'package:barcodeapp/models/networking/product_info_api_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeRepository {

  final ProductApiService _productApiService = ProductApiService.create();

  Future<String> scanStart() async {
    var barcodeResult = '';
    try {
      barcodeResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeResult = 'Failed to get platform version.';
    }
    return barcodeResult;
  }

  //todo JANコードをchopperへ投げて製品情報取得
  Future<List<Product>> getProductInfo(String barcodeScanRes) async {
    Response response;
    var results = <Product>[];
    try {
      response =
      await _productApiService.getProductInfo(janCode: barcodeScanRes);

    if (response.isSuccessful) {
      final responseBody = response.body; //json.decode(json)みたいなもの？
      //モデルクラスに入れる前にみたい場合はキー名をStringでかく必要ありresponseBody['hits'][0]['image']
      print('responseBody:$responseBody');
      results = ProductHits.fromMap(responseBody).hits;
      print('ProductHits.fromMap変換後のList<Product>:$results');
    } else {
//レスポンス返ってきたけど失敗(responseの中のstatusCode,errorを出す)
      final errorCode = response.statusCode;
      final error = response.error;
      print('response is not successful:$errorCode / $error');
    }
  } on Exception catch (error) {
      print('error:$error');
    }
    return results;
//  print('repository:JANコードを投げて情報取得:$barcodeScanRes');
}

  void dispose() {
    _productApiService.dispose();
  }


}

