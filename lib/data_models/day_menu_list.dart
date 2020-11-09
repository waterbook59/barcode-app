import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/data_models/product.dart';
import 'package:flutter/material.dart';

class DayMenuList {

  DayMenuList(this.dayMenu, this.breakfastCategory, this.breakfastProduct,
      this.lunchCategory, this.lunchProduct, this.snackCategory,
      this.snackProduct, this.dinnerCategory, this.dinnerProduct);

  final String dayMenu; //○日目
  final List<Category> breakfastCategory;
  final List<Product> breakfastProduct;
  final List<Category> lunchCategory;
  final List<Product> lunchProduct;
  final List<Category> snackCategory;
  final List<Product> snackProduct;
  final List<Category> dinnerCategory;
  final List<Product> dinnerProduct;


}


