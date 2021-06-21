import 'package:freezed_annotation/freezed_annotation.dart';

part 'userInfoState.freezed.dart';

@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState({@Default(false) bool isLoading}) = _Default;
}
