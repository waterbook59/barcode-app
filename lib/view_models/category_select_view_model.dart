import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:flutter/material.dart';

class CategorySelectViewModel extends ChangeNotifier{

  CategorySelectViewModel({BarcodeRepository repository})
      : _barcodeRepository = repository;
  final BarcodeRepository _barcodeRepository;



  bool _isSelected =false;
  bool get isSelected => _isSelected;

  //
  Future<void> categoryTapped({bool isSelected}) async{
    _isSelected =!isSelected;
    notifyListeners();
  }

}