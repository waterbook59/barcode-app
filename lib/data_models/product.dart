import 'dart:convert';

import 'package:barcodeapp/data_models/product_image.dart';
import 'package:flutter/material.dart';

///Productにしているが実質Hitsクラス
class Product {
  final String name;
  final String image;
  final String description;

//  String imageUrl;
//  final List<ProductImage> image;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Product({
    @required this.name,
    @required this.image,
    @required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          description == other.description);

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'Product{' +
        ' name: $name,' +
        ' image: $image,' +
        ' description: $description,' +
        '}';
  }

  Product copyWith({
    String name,
    List<ProductImage> image,
    String description,
  }) {
    return new Product(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'description': this.description,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {

    print('fromMapの引数のmap(hitsのimage):${map['image']}');
    //{small:https://...,medium:https://...}
    return new Product(
      name: map['name'] as String,

      image:
///うまくimage{small:,medium}をリスト化できなかった。。。map['image'] as ListがListじゃなくてMap
      ///map['image']がMap<String, dynamic>でList<dynamic>へ変換できれはいける(もしくはその逆)？
      ///_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'List<dynamic>' in type cast
//     (map['image'] as List)
//      ?.map((e) {
//        print('eの値:$e');
//        return e == null
//            ? null
//            : ProductImage.fromMap(e as Map<String, dynamic>);
//      })?.toList(),

      map['image']['small']as String,
      description: map['description'] as String,
    );
  }

//</editor-fold>
}
