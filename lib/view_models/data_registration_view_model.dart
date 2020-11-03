import 'package:barcodeapp/data_models/product.dart';
import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class DataRegistrationViewModel extends ChangeNotifier{

  //todo diなし
  final BarcodeRepository _barcodeRepository = BarcodeRepository();

  final TextEditingController _productNameController= TextEditingController();
  TextEditingController get productNameController => _productNameController;
  String _productUrl = '';
  String get productUrl => _productUrl;
  final TextEditingController _productNumberController= TextEditingController();
  TextEditingController get productNumberController => _productNumberController;
  TextEditingController _dateEditController = TextEditingController();
  TextEditingController get dateEditController => _dateEditController;
  DateTime _validDateTime = DateTime.now();
  DateTime get validDateTime => _validDateTime;

  String _barcodeScanRes='';
  String  get barcodeScanRes => _barcodeScanRes;


  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;
  List<Product>  _products =<Product>[];
  List<Product> get products => _products;


  Future<void> registerProductData() async{
    await _barcodeRepository.registerProductData();
    notifyListeners();
  }

  void productNameClear() {
    _productNameController.clear();
    notifyListeners();
  }
  void productNumberClear() {
    _productNumberController.clear();
    notifyListeners();
  }

  void dateClear() {
    _dateEditController.clear();
  }

  void dateChange(DateTime newDateTime) {
    _validDateTime = newDateTime;
    //intlパッケージを使ってpickerで選択した年月日を日本語表示
    _dateEditController.text =
        DateFormat.yMMMd('ja').format(newDateTime).toString();
  }

  Future<void> scanStart() async{
    _barcodeScanRes = await _barcodeRepository.scanStart();
    notifyListeners();
  }

  Future<void> getProductInfo() async{
    _isProcessing= true;
    notifyListeners();

    _products = await _barcodeRepository.getProductInfo(_barcodeScanRes);
    if (_products.isEmpty) {
     await Fluttertoast.showToast(
        msg: '商品データが見つかりません',
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 14,
        textColor: Colors.black,
        backgroundColor: Colors.cyan,
      );
    } else {
      print('サーチ結果：${_products[0].name}');
      _productNameController.text =_products[0].name;
      _productUrl= _products[0].productImage.medium;
    }

    _isProcessing= false;
    notifyListeners();
  }

  @override
  void dispose() {
    _barcodeRepository.dispose();
    super.dispose();
  }

}
