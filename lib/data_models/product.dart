import 'dart:convert';

import 'package:barcodeapp/data_models/product_image.dart';
import 'package:flutter/material.dart';

///Productにしているが実質Hitsクラス
class Product {
  final String name;
  final ProductImage productImage;
  final String description;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Product({
    @required this.name,
    @required this.productImage,
    @required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          productImage == other.productImage &&
          description == other.description);

  @override
  int get hashCode =>
      name.hashCode ^ productImage.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'Product{' +
        ' name: $name,' +
        ' productImage: $productImage,' +
        ' description: $description,' +
        '}';
  }

  Product copyWith({
    String name,
    ProductImage productImage,
    String description,
  }) {
    return new Product(
      name: name ?? this.name,
      productImage: productImage ?? this.productImage,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'productImage': this.productImage,
      'description': this.description,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return new Product(
      name: map['name'] as String,
      productImage: ProductImage.fromMap(map['image'] ),
      description: map['description'] as String,
    );
  }

//</editor-fold>
}
