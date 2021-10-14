// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizationDataRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalizationDataRequest _$_$_LocalizationDataRequestFromJson(
    Map<String, dynamic> json) {
  return _$_LocalizationDataRequest(
    code: json['code'] as String?,
  );
}

Map<String, dynamic> _$_$_LocalizationDataRequestToJson(
    _$_LocalizationDataRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  return val;
}
