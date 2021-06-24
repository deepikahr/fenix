import 'package:freezed_annotation/freezed_annotation.dart';

part 'homeState.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
  }) = _Default;
}
