import 'package:freezed_annotation/freezed_annotation.dart';

part 'verifyNumberState.freezed.dart';

@freezed
class VerifyNumberState with _$VerifyNumberState {
  const factory VerifyNumberState({@Default(false) bool isLoading}) = _Default;
}
