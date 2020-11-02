import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:flutter/material.dart';
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

  }

  void dateChange(DateTime newDateTime) {
    _validDateTime = newDateTime;
    //intlパッケージを使ってpickerで選択した年月日を日本語表示
    _dateEditController.text =
        DateFormat.yMMMd('ja').format(newDateTime).toString();
  }


  }
