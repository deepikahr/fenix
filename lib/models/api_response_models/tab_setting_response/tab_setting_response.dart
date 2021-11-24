import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'tab_setting_response.freezed.dart';
part 'tab_setting_response.g.dart';

@freezed
class TabSettingResponse
    with BaseModel<TabSettingResponse>, _$TabSettingResponse {
  const TabSettingResponse._();

  const factory TabSettingResponse({
    @Default(false) bool resetCategory,
    @Default(false) bool callToWaiter,
    @Default(false) bool payTypeKiosk,
    @Default(false) bool validatePaymentByWaiter,
    @Default('red') String themeColour,
    @Default('printer') String orderingMode,
    @Default('GRID') String viewType,
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
