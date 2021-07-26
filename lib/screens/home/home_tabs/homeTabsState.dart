import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'homeTabsState.freezed.dart';

@freezed
class HomeTabsState with _$HomeTabsState {
  const factory HomeTabsState({
    @Default(false) bool isLoading,
    @Default(0) int currentIndex,
    String? selectedLanguage,
    @Default([]) List<LanguageResponse> languages
  }) = _Default;
}
