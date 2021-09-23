// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuResponse _$_$_MenuResponseFromJson(Map<String, dynamic> json) {
  return _$_MenuResponse(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    menuId: json['menuId'] as String?,
    masterMenuId: json['masterMenuId'] as String?,
    vendorId: json['vendorId'] as String?,
    franchiseId: json['franchiseId'] as String?,
    isMenuCloned: json['isMenuCloned'] as bool? ?? false,
    cloneType: json['cloneType'] as String?,
    menuClonedFromMasterMenu:
        json['menuClonedFromMasterMenu'] as bool? ?? false,
    menuClonedFromRestaurantMenu:
        json['menuClonedFromRestaurantMenu'] as bool? ?? false,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$_$_MenuResponseToJson(_$_MenuResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'menuId': instance.menuId,
      'masterMenuId': instance.masterMenuId,
      'vendorId': instance.vendorId,
      'franchiseId': instance.franchiseId,
      'isMenuCloned': instance.isMenuCloned,
      'cloneType': instance.cloneType,
      'menuClonedFromMasterMenu': instance.menuClonedFromMasterMenu,
      'menuClonedFromRestaurantMenu': instance.menuClonedFromRestaurantMenu,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
