import 'package:freezed_annotation/freezed_annotation.dart';

part 'changePasswordState.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(false) bool isLoading,
  }) = _Default;
}
