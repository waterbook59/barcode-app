import 'package:barcodeapp/data_models/product.dart';
import 'package:flutter/material.dart';

class ProductHits{
  final int totalResultsAvailable;
  final int totalResultsReturned;
  final List<Product> hits;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  // ignore: sort_constructors_first
  const ProductHits({
    @required this.totalResultsAvailable,
    @required this.totalResultsReturned,
    @required this.hits,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductHits &&
          runtimeType == other.runtimeType &&
          totalResultsAvailable == other.totalResultsAvailable &&
          totalResultsReturned == other.totalResultsReturned &&
          hits == other.hits);

  @override
  int get hashCode =>
      totalResultsAvailable.hashCode ^
      totalResultsReturned.hashCode ^
      hits.hashCode;

  @override
  String toString() {
    ///結合の仕方を変更(Replace with interpolation)
    // ignore: lines_longer_than_80_chars
    return 'ProductHits{${' totalResultsAvailable: $totalResultsAvailable,'}${' totalResultsReturned: $totalResultsReturned,'}${' hits: $hits,'}}';
  }

  ProductHits copyWith({
    int totalResultsAvailable,
    int totalResultsReturned,
    List<Product> hits,
  }) {
    ///ProductHitsの前のnewを削除
    return  ProductHits(
      totalResultsAvailable:
          totalResultsAvailable ?? this.totalResultsAvailable,
      totalResultsReturned: totalResultsReturned ?? this.totalResultsReturned,
      hits: hits ?? this.hits,
    );
  }

  ///returnの後ろへ<String,dynamic>追加、this.削除
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalResultsAvailable': totalResultsAvailable,
      'totalResultsReturned': totalResultsReturned,
      'hits': hits,
    };
  }

  ///fromMapで自分で作ったモデルクラスのリストへ変換する時は手動で修正
  ///  Productの前のnewを削除、eにdynamicの型付け
  // ignore: sort_constructors_first
  factory ProductHits.fromMap(Map<String, dynamic> map) {
    return  ProductHits(
      totalResultsAvailable: map['totalResultsAvailable'] as int,
      totalResultsReturned: map['totalResultsReturned'] as int,
      hits: (map['hits'] as List)
          ?.map(( dynamic e ) =>
        e == null ? null : Product.fromMap(e as Map<String, dynamic>))
          ?.toList(),


    );
  }

//</editor-fold>
}

