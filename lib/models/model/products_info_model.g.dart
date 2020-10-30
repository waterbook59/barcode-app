// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsInfo _$ProductsInfoFromJson(Map<String, dynamic> json) {
  return ProductsInfo(
    totalResultsAvailable: json['totalResultsAvailable'] as int,
    totalResultsReturned: json['totalResultsReturned'] as int,
    hits: (json['hits'] as List)
        ?.map((e) =>
            e == null ? null : ProductData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductsInfoToJson(ProductsInfo instance) =>
    <String, dynamic>{
      'totalResultsAvailable': instance.totalResultsAvailable,
      'totalResultsReturned': instance.totalResultsReturned,
      'hits': instance.hits,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) {
  return ProductData(
    name: json['name'] as String,
    image: (json['image'] as List)
        ?.map((e) => e == null
            ? null
            : ProductPicture.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
    };

ProductPicture _$ProductPictureFromJson(Map<String, dynamic> json) {
  return ProductPicture(
    small: json['small'] as String,
    medium: json['medium'] as String,
  );
}

Map<String, dynamic> _$ProductPictureToJson(ProductPicture instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
    };
