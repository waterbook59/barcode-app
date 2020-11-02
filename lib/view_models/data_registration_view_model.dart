import 'package:flutter/material.dart';

class DataRegistrationViewModel extends ChangeNotifier{

  final TextEditingController _productNameController= TextEditingController();
  TextEditingController get productNameController => _productNameController;

  void productNameClear() {
    _productNameController.clear();
    notifyListeners();
  }


}