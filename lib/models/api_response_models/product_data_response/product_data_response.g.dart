// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDataResponse _$_$_ProductDataResponseFromJson(
    Map<String, dynamic> json) {
  return _$_ProductDataResponse(
    categoryTitle: json['categoryTitle'] as String?,
    product: json['product'] == null
        ? null
        : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ProductDataResponseToJson(
        _$_ProductDataResponse instance) =>
    <String, dynamic>{
      'categoryTitle': instance.categoryTitle,
      'product': instance.product,
    };
