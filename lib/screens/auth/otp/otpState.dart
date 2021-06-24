import 'package:freezed_annotation/freezed_annotation.dart';

part 'otpState.freezed.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    @Default(false) bool isLoading,
  }) = _Default;
}
