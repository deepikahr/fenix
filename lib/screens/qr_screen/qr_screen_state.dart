import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_screen_state.freezed.dart';

@freezed
class QRScreenState with _$QRScreenState {
  const factory QRScreenState({
    @Default(false) bool isLoading,
  }) = _Default;
}