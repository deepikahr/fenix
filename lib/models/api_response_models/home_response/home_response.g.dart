// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeResponse _$_$_HomeResponseFromJson(Map<String, dynamic> json) {
  return _$_HomeResponse(
    banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => BannerResponse.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    category: (json['category'] as List<dynamic>?)
            ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_HomeResponseToJson(_$_HomeResponse instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'category': instance.category,
    };
