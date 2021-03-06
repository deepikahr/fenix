import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_setting_state.freezed.dart';

@freezed
class AccessSettingsState with _$AccessSettingsState {
  const factory AccessSettingsState({
    @Default(false) bool isLoading,
  }) = _Default;
}
