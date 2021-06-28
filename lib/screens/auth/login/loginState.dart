import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginState.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
  }) = _Default;
}
