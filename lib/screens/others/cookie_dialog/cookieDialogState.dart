import 'package:freezed_annotation/freezed_annotation.dart';

part 'cookieDialogState.freezed.dart';

@freezed
class CookieDialogState with _$CookieDialogState {
  const factory CookieDialogState({
    @Default(true) bool isLoading,
    @Default(0) num calculatedAmount,
  }) = _Default;
}
