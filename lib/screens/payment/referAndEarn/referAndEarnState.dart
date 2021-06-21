import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/referralDataResponse/referralDataResponse.dart';

part 'referAndEarnState.freezed.dart';

@freezed
class ReferAndEarnState with _$ReferAndEarnState {
  const factory ReferAndEarnState({
    @Default(false) bool isLoading,
    ReferralDataResponse? referralData,
    String? currencySymbol,
  }) = _Default;
}
