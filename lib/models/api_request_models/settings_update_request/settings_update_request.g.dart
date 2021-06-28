// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsUpdateRequest _$_$_SettingsUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return _$_SettingsUpdateRequest(
    tabSetting: json['tabSetting'] == null
        ? null
        : TabSettingResponse.fromJson(
            json['tabSetting'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_SettingsUpdateRequestToJson(
        _$_SettingsUpdateRequest instance) =>
    <String, dynamic>{
      'tabSetting': instance.tabSetting,
    };
