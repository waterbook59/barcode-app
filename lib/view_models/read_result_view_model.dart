
import 'package:barcodeapp/data_models/product.dart';
import 'package:barcodeapp/data_models/product_hits.dart';
import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:flutter/material.dart';

class ReadResultViewModel extends ChangeNotifier{

  //diなし
  final BarcodeRepository _barcodeRepository = BarcodeRepository();

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;
  List<Product>  _products =<Product>[];

  Future<void> getProductInfo(String barcodeScanRes) async{

    _isProcessing= true;
    notifyListeners();

    _products = await _barcodeRepository.getProductInfo(barcodeScanRes);
    print('サーチ結果：${_products[0].name}');


    _isProcessing= false;
    notifyListeners();
  }

  @override
  void dispose() {
    _barcodeRepository.dispose();
    super.dispose();
  }
}