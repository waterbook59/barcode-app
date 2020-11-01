import 'package:flutter/material.dart';

class ProductImage{
//  final String url;
////  final String height;
////  final String width;

final String small;
final String medium;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const ProductImage({
     this.small,
     this.medium,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductImage &&
          runtimeType == other.runtimeType &&
          small == other.small &&
          medium == other.medium);

  @override
  int get hashCode => small.hashCode ^ medium.hashCode;

  @override
  String toString() {
    return 'ProductImage{' + ' small: $small,' + ' medium: $medium,' + '}';
  }

  ProductImage copyWith({
    String small,
    String medium,
  }) {
    return new ProductImage(
      small: small ?? this.small,
      medium: medium ?? this.medium,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'small': this.small,
      'medium': this.medium,
    };
  }

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return new ProductImage(
      small: map['small'] as String,
      medium: map['medium'] as String,
    );
  }

//</editor-fold>
}