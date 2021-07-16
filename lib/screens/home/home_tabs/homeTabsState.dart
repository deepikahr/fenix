import 'package:freezed_annotation/freezed_annotation.dart';

part 'homeTabsState.freezed.dart';

@freezed
class HomeTabsState with _$HomeTabsState {
  const factory HomeTabsState({
    @Default(false) bool isLoading,
    @Default(0) int currentIndex,
    String? selectedLanguage
  }) = _Default;
}
