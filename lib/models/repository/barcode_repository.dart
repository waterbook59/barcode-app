import 'dart:convert';
import 'dart:io';

import 'package:barcodeapp/data_models/product.dart';
import 'package:barcodeapp/data_models/product_hits.dart';
import 'package:barcodeapp/models/networking/product_info_api_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';

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
        //responseBodyはjson.decode(json)した後と同じ
        ///response.bodyは何もしないとdynamic型、fromMap(引数)の引数に入るのはMap<String,dynamic>型
        ///responseBodyをas Map<dynamic,String>を使って変換する
         final responseBody = response.body as Map<String, dynamic>;

        //モデルクラスに入れる前にみたい場合はキー名をStringでかく必要ありresponseBody['hits'][0]['image']
        print('responseBody:$responseBody');
        results = ProductHits
            .fromMap(responseBody)
            .hits;
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

  //todo
  Future<void> registerProductData() async{
    print('registerProductDataで商品情報登録');
  }

  Future<File>pickImage() async{
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.getImage(source: ImageSource.camera);
     return File(pickImage.path);
  }


}

