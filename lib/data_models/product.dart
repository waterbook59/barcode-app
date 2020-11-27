import 'package:barcodeapp/data_models/product_image.dart';
import 'package:flutter/material.dart';

///Productにしているが実質Hitsクラス
class Product {
  final String productId;
  final String name;
  final ProductImage productImage;
  final String description;

  //  使用量入れる必要あり？
  //todo TypeConverterを追加してjsonをStringとして保存する？


//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Product({
    @required this.productId,
    @required this.name,
    @required this.productImage,
    @required this.description,
  });

//総量と@override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Product &&
              runtimeType == other.runtimeType &&
              productId == other.productId &&
              name == other.name &&
              productImage == other.productImage &&
              description == other.description
          );


  @override
  int get hashCode =>
      productId.hashCode ^
      name.hashCode ^
      productImage.hashCode ^
      description.hashCode;

  ///結合の仕方を変更
  @override
  String toString() {
    return 'Product{${' productId: $productId,'}${' name: $name,'}${' productImage: $productImage,'}${' description: $description,'}}';
  }


  Product copyWith({
    String productId,
    String name,
    ProductImage productImage,
    String description,
  }) {
    return  Product(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      productImage: productImage ?? this.productImage,
      description: description ?? this.description,
    );
  }

  ///returnの後ろへ<String,dynamic>追加、this.削除
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'name': name,
      'productImage': productImage,
      'description': description,
    };
  }

  ///Productの前のnewを削除
  factory Product.fromMap(Map<String, dynamic> map) {
    return  Product(
      productId: map['productId'] as String,
      name: map['name'] as String,
      productImage: map['productImage'] as ProductImage,
      description: map['description'] as String,
    );
  }


  //</editor-fold>

}
