import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:flutter/material.dart';

class BarcodeReadViewModel extends ChangeNotifier {

//  BarcodeReadViewModel({BarcodeRepository repository})
//      : _barcodeRepository = repository;
//  final BarcodeRepository _barcodeRepository;

//diなし
  final BarcodeRepository _barcodeRepository = BarcodeRepository();

  String _barcodeScanRes='';
  String  get barcodeScanRes => _barcodeScanRes;

  Future<void> scanStart() async{
  _barcodeScanRes = await _barcodeRepository.scanStart();
  notifyListeners();



  }



}
