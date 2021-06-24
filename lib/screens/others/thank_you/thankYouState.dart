import 'package:freezed_annotation/freezed_annotation.dart';

part 'thankYouState.freezed.dart';

@freezed
class ThankYouState with _$ThankYouState {
  const factory ThankYouState({
    @Default(false) bool isLoading,
  }) = _Default;
}
