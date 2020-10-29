import 'package:barcodeapp/data_models/product_image.dart';
import 'package:flutter/material.dart';

class Product{
  final String name;
//  String imageUrl;
//  final List<ProductImage> exImage;
//  final List<ProductImage> image;
  final String description;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Product({
    @required this.name,
    @required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description);

  @override
  int get hashCode => name.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'Product{' + ' name: $name,' + ' description: $description,' + '}';
  }

  Product copyWith({
    String name,
    String description,
  }) {
    return new Product(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'description': this.description,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return new Product(
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

//</editor-fold>
}
