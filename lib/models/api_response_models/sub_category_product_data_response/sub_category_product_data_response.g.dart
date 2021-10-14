// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_product_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubCategoryProductDataResponse _$_$_SubCategoryProductDataResponseFromJson(
    Map<String, dynamic> json) {
  return _$_SubCategoryProductDataResponse(
    subCategoryTitle: json['subCategoryTitle'] as String?,
    product: json['product'] == null
        ? null
        : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_SubCategoryProductDataResponseToJson(
        _$_SubCategoryProductDataResponse instance) =>
    <String, dynamic>{
      'subCategoryTitle': instance.subCategoryTitle,
      'product': instance.product,
    };
