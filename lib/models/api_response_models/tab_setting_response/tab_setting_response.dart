import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'tab_setting_response.freezed.dart';
part 'tab_setting_response.g.dart';

@freezed
class TabSettingResponse
    with BaseModel<TabSettingResponse>, _$TabSettingResponse {
  const TabSettingResponse._();

  const factory TabSettingResponse({
    bool? resetCategory,
    bool? callToWaiter,
    bool? payTypeKiosk,
    bool? validatePaymentByWaiter,
    String? themeColour,
    String? orderingMode,
    String? viewType,
  }) = _TabSettingResponse;

  factory TabSettingResponse.fromJson(Map<String, dynamic> json) =>
      _$TabSettingResponseFromJson(json);

  @override
  TabSettingResponse fromMap(Map<String, dynamic> map) {
    return TabSettingResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
