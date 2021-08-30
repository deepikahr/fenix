// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BannerResponse _$_$_BannerResponseFromJson(Map<String, dynamic> json) {
  return _$_BannerResponse(
    id: json['_id'] as String?,
    image: json['image'] == null
        ? null
        : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
    title: json['title'] as String?,
    productId: json['productId'] as String?,
  );
}

Map<String, dynamic> _$_$_BannerResponseToJson(_$_BannerResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'productId': instance.productId,
    };
