import 'package:fenix_user/models/api_response_models/tab_setting_response/tab_setting_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'settings_update_request.freezed.dart';
part 'settings_update_request.g.dart';

@freezed
class SettingsUpdateRequest with BaseModel<SettingsUpdateRequest>, _$SettingsUpdateRequest {
  const SettingsUpdateRequest._();

  const factory SettingsUpdateRequest({
    TabSettingResponse? tabSetting
  }) = _SettingsUpdateRequest;

  factory SettingsUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$SettingsUpdateRequestFromJson(json);

  @override
  SettingsUpdateRequest fromMap(Map<String, dynamic> map) {
    return SettingsUpdateRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
