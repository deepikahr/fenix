import 'package:freezed_annotation/freezed_annotation.dart';

part 'addMoneyState.freezed.dart';

@freezed
class AddMoneyState with _$AddMoneyState {
  const factory AddMoneyState({
    @Default(false) bool isLoading,
    String? currencySymbol,
  }) = _Default;
}
