import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/referralSettingDataResponse/referralSettingDataResponse.dart';

part 'addNumberState.freezed.dart';

@freezed
class AddNumberState with _$AddNumberState {
  const factory AddNumberState({
    @Default(false) bool isLoading,
    @Default(false) bool isGetReferralLoading,
    @Default('+91') String countryCode,
    ReferralSettingDataResponse? referralAvailable,
  }) = _Default;
}
