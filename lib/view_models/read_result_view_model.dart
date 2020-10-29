
import 'package:barcodeapp/data_models/product.dart';
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
    notifyListeners();
    _isProcessing= false;
    notifyListeners();
  }
}