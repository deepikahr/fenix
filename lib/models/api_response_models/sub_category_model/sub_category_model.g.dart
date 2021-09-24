// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubCategoryModel _$_$_SubCategoryModelFromJson(Map<String, dynamic> json) {
  return _$_SubCategoryModel(
    data: (json['data'] as List<dynamic>?)
            ?.map(
                (e) => SubCategoryResponse.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    total: json['total'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_SubCategoryModelToJson(
        _$_SubCategoryModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
