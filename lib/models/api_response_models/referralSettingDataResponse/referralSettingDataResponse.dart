import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'referralSettingDataResponse.freezed.dart';
part 'referralSettingDataResponse.g.dart';

@freezed
class ReferralSettingDataResponse
    with BaseModel<ReferralSettingDataResponse>, _$ReferralSettingDataResponse {
  const ReferralSettingDataResponse._();

  const factory ReferralSettingDataResponse({
    @Default(false) bool isReferralAvailable,
    @Default(.0) double bonusToReferralAccount,
    @Default(.0) double bonusToReferralByAccount,
  }) = _ReferralSettingDataResponse;

  factory ReferralSettingDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralSettingDataResponseFromJson(json);

  @override
  ReferralSettingDataResponse fromMap(Map<String, dynamic> map) {
    return ReferralSettingDataResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
