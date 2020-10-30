

import 'package:json_annotation/json_annotation.dart';

part 'products_info_model.g.dart';

@JsonSerializable()
//product_hitsのjson_selializable版
class ProductsInfo {
  final int totalResultsAvailable;
  final int totalResultsReturned;
  final List<ProductData> hits;


  ProductsInfo(
      {this.totalResultsAvailable, this.totalResultsReturned, this.hits});
  factory ProductsInfo.fromJson(Map<String, dynamic> json) => _$ProductsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsInfoToJson(this);

}

@JsonSerializable()
//productのjson_selializable版
class ProductData {
  final String name;
  final List<ProductPicture> image;
  final String description;
  ProductData({this.name, this.image, this.description,});
  factory ProductData.fromJson(Map<String, dynamic> json) => _$ProductDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDataToJson(this);

}

@JsonSerializable()
//productImageのjson_selializable版
class ProductPicture {
  final String small;
  final String medium;

  ProductPicture({this.small, this.medium});
  factory ProductPicture.fromJson(Map<String, dynamic> json) => _$ProductPictureFromJson(json);
  Map<String, dynamic> toJson() => _$ProductPictureToJson(this);
}