import 'package:freezed_annotation/freezed_annotation.dart';

part 'orderInProgressState.freezed.dart';

@freezed
class OrderInProgressState with _$OrderInProgressState {
  const factory OrderInProgressState(
      {@Default(false) bool isLoading, String? selectedLanguage}) = _Default;
}
