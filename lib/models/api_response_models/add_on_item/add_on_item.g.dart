// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_on_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddOnItem _$_$_AddOnItemFromJson(Map<String, dynamic> json) {
  return _$_AddOnItem(
    id: json['_id'] as String?,
    addOnCategoryId: json['addOnCategoryId'] as String?,
    addOnItemId: json['addOnItemId'] as String?,
    addOnItemName: json['addOnItemName'] as String?,
    addOnItemPrice: (json['addOnItemPrice'] as num?)?.toDouble(),
    quantity: json['quantity'] as int? ?? 1,
    selected: json['selected'] as bool?,
    imageId: json['imageId'] as String?,
    filePath: json['filePath'] as String?,
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$_$_AddOnItemToJson(_$_AddOnItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'addOnCategoryId': instance.addOnCategoryId,
      'addOnItemId': instance.addOnItemId,
      'addOnItemName': instance.addOnItemName,
      'addOnItemPrice': instance.addOnItemPrice,
      'quantity': instance.quantity,
      'selected': instance.selected,
      'imageId': instance.imageId,
      'filePath': instance.filePath,
      'imageUrl': instance.imageUrl,
    };
