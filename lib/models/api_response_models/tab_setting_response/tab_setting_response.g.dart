// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_setting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TabSettingResponse _$_$_TabSettingResponseFromJson(
    Map<String, dynamic> json) {
  return _$_TabSettingResponse(
    resetCategory: json['resetCategory'] as bool? ?? false,
    callToWaiter: json['callToWaiter'] as bool? ?? false,
    payTypeKiosk: json['payTypeKiosk'] as bool? ?? false,
    validatePaymentByWaiter: json['validatePaymentByWaiter'] as bool? ?? false,
    themeColour: json['themeColour'] as String? ?? 'red',
    orderingMode: json['orderingMode'] as String? ?? 'printer',
    viewType: json['viewType'] as String? ?? 'GRID',
  );
}

Map<String, dynamic> _$_$_TabSettingResponseToJson(
        _$_TabSettingResponse instance) =>
    <String, dynamic>{
      'resetCategory': instance.resetCategory,
      'callToWaiter': instance.callToWaiter,
      'payTypeKiosk': instance.payTypeKiosk,
      'validatePaymentByWaiter': instance.validatePaymentByWaiter,
      'themeColour': instance.themeColour,
      'orderingMode': instance.orderingMode,
      'viewType': instance.viewType,
    };
