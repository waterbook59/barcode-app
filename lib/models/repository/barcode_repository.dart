import 'dart:convert';
import 'dart:io';

import 'package:barcodeapp/data_models/product.dart';
import 'package:barcodeapp/data_models/product_hits.dart';
import 'package:barcodeapp/models/db/product_info/product_info_dao.dart';
import 'package:barcodeapp/models/db/product_info/product_info_database.dart';
import 'package:barcodeapp/models/networking/product_info_api_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barcodeapp/util/extensions.dart';//自分で追加

class BarcodeRepository {

  BarcodeRepository(
      { ProductApiService productApiService, ProductInfoDao productInfoDao})
      :
        _productApiService = productApiService,
        _productInfoDao = productInfoDao;

  final ProductApiService _productApiService;
  final ProductInfoDao _productInfoDao;

  ///DIなし
//  final ProductApiService _productApiService = ProductApiService.create();

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
        //todo resultをDB経由で取得する
        results = await insertAndReadFromDB(responseBody);

//        results = ProductHits
//            .fromMap(responseBody)
//            .hits;
//        print('ProductHits.fromMap変換後のList<Product>:$results');



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
  Future<void> registerProductData() async {
    print('registerProductDataで商品情報登録');
  }

  Future<File> pickImage() async {
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.getImage(source: ImageSource.camera);
    return File(pickImage.path);
  }

  Future<List<Product>> insertAndReadFromDB(Map<String,dynamic> responseBody) async{
    var products = <Product>[];
    var productRecords = <ProductRecord>[];
    var productRecordImages = <ProductRecordImage>[];
    var joinedResults =<JoinedProduct>[];

    products = ProductHits.fromMap(responseBody).hits;
    try{
      //2.モデルクラス(List<Product>)をDBのテーブルクラスへ変換
      productRecords = products.toProductRecord(products).cast<ProductRecord>();
      productRecordImages =
          products.toProductRecordImage(products).cast<ProductRecordImage>();
      print('products:$products');
      print('productRecords:$productRecords');
      print('productRecordImages:$productRecordImages');
      /// 3.2つのテーブルをDBへinsert
      await _productInfoDao.insertDB(productRecords, productRecordImages);
//      joinTable =await productInfoDao.insertAndTableDB(productRecords, productRecordImages);
//      print('query.getの結果：${joinTable.toString()}');
      ///4.テーブル内部結合してJoinedProductへ格納＆読込(transactionの中でやるとエラーなので上のinsertと切り離して実施）
      joinedResults = await _productInfoDao.getJoinedProduct();
      print('List<JoinedProduct:${joinedResults[0].productRecord.description}>');
      ///5.JoinedProductクラスに格納されたデータをProductへ再格納して返す(extensions:)
      products = joinedResults.toProduct(joinedResults);

    }on Exception catch (error) {
      print('error:$error');
    }
    return products;
  }


}

