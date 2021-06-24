import 'package:freezed_annotation/freezed_annotation.dart';

part 'settingsState.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool isLoading,
  }) = _Default;
}
