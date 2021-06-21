import 'package:freezed_annotation/freezed_annotation.dart';

part 'cookieScreenState.freezed.dart';

@freezed
class CookieScreenState with _$CookieScreenState {
  const factory CookieScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool isButtonLoading,
    @Default(0) num loyaltyPoint,
    @Default(0) num loyaltyPointMonetaryValue,
  }) = _Default;
}
