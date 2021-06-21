import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/referralSettingDataResponse/referralSettingDataResponse.dart';
import 'package:restaurant_saas/models/api_response_models/referralUserDataResponse/referralUserDataResponse.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'referralDataResponse.freezed.dart';
part 'referralDataResponse.g.dart';

@freezed
class ReferralDataResponse
    with BaseModel<ReferralDataResponse>, _$ReferralDataResponse {
  const ReferralDataResponse._();

  const factory ReferralDataResponse({
    ReferralSettingDataResponse? settingData,
    ReferralUserDataResponse? userData,
  }) = _ReferralDataResponse;

  factory ReferralDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralDataResponseFromJson(json);

  @override
  ReferralDataResponse fromMap(Map<String, dynamic> map) {
    return ReferralDataResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
