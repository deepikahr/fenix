import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'referralUserDataResponse.freezed.dart';
part 'referralUserDataResponse.g.dart';

@freezed
class ReferralUserDataResponse
    with BaseModel<ReferralUserDataResponse>, _$ReferralUserDataResponse {
  const ReferralUserDataResponse._();

  const factory ReferralUserDataResponse({
    @JsonKey(name: '_id') String? id,
    String? referralCode,
  }) = _ReferralUserDataResponse;

  factory ReferralUserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralUserDataResponseFromJson(json);

  @override
  ReferralUserDataResponse fromMap(Map<String, dynamic> map) {
    return ReferralUserDataResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
