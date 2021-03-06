// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsResponse _$_$_SettingsResponseFromJson(Map<String, dynamic> json) {
  return _$_SettingsResponse(
    tabSetting:
        TabSettingResponse.fromJson(json['tabSetting'] as Map<String, dynamic>),
    id: json['_id'] as String?,
    franchise: json['franchise'] == null
        ? null
        : FranchiseModel.fromJson(json['franchise'] as Map<String, dynamic>),
    vendorId: json['vendorId'] as String?,
    tableName: json['tableName'] as String?,
    tableCapacity: json['tableCapacity'] as int? ?? 0,
    tableNumber: json['tableNumber'] as int?,
    franchiseCode: json['franchiseCode'] as int?,
  );
}

Map<String, dynamic> _$_$_SettingsResponseToJson(
        _$_SettingsResponse instance) =>
    <String, dynamic>{
      'tabSetting': instance.tabSetting,
      '_id': instance.id,
      'franchise': instance.franchise,
      'vendorId': instance.vendorId,
      'tableName': instance.tableName,
      'tableCapacity': instance.tableCapacity,
      'tableNumber': instance.tableNumber,
      'franchiseCode': instance.franchiseCode,
    };
