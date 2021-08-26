// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_setting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TabSettingResponse _$_$_TabSettingResponseFromJson(
    Map<String, dynamic> json) {
  return _$_TabSettingResponse(
    resetCategory: json['resetCategory'] as bool?,
    callToWaiter: json['callToWaiter'] as bool?,
    payTypeKiosk: json['payTypeKiosk'] as bool?,
    validatePaymentByWaiter: json['validatePaymentByWaiter'] as bool?,
    themeColour: json['themeColour'] as String?,
    orderingMode: json['orderingMode'] as String?,
    viewType: json['viewType'] as String?,
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
