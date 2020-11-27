import 'package:barcodeapp/data_models/product_image.dart';
import 'package:flutter/material.dart';

///Productにしているが実質Hitsクラス
class Product {
  final String name;
  final ProductImage productImage;
  final String description;
  //総量と使用量入れる必要あり？

  //todo TypeConverterを追加してjsonをStringとして保存する？
//<editor-fold desc="Data Methods" defaultstate="collapsed">

  // ignore: sort_constructors_first
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
    ///結合の仕方を変更
    // ignore: lines_longer_than_80_chars
    return 'Product{${' name: $name,'}${' productImage: $productImage,'}${' description: $description,'}}';
  }

  Product copyWith({
    String name,
    ProductImage productImage,
    String description,
  }) {
    return  Product(
      name: name ?? this.name,
      productImage: productImage ?? this.productImage,
      description: description ?? this.description,
    );
  }

  ///returnの後ろへ<String,dynamic>追加、this.削除
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'productImage': productImage,
      'description': description,
    };
  }

  ///Productの前のnewを削除
  // ignore: sort_constructors_first
  factory Product.fromMap(Map<String, dynamic> map) {
    return  Product(
      name: map['name'] as String,
      productImage: ProductImage.fromMap(map['image'] as Map<String, dynamic>),
      description: map['description'] as String,
    );
  }

//</editor-fold>
}
