import 'package:fenix_user/models/api_response_models/franchise_model/franchise_model.dart';
import 'package:fenix_user/models/api_response_models/tab_setting_response/tab_setting_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'settings_response.freezed.dart';
part 'settings_response.g.dart';

@freezed
class SettingsResponse with BaseModel<SettingsResponse>, _$SettingsResponse {
  const SettingsResponse._();

  const factory SettingsResponse(
      {TabSettingResponse? tabSetting,
      @JsonKey(name: '_id') String? id,
      FranchiseModel? franchiseId,
      String? vendorId,
      String? tableName,
      int? tableCapacity,
      int? tableNumber,
      int? franchiseCode}) = _SettingsResponse;

  factory SettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsResponseFromJson(json);

  @override
  SettingsResponse fromMap(Map<String, dynamic> map) {
    return SettingsResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
