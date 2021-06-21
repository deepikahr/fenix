import 'package:freezed_annotation/freezed_annotation.dart';

part 'cartScreenState.freezed.dart';

@freezed
class CartScreenState with _$CartScreenState {
  const factory CartScreenState({
    @Default(false) bool isLoading,
    @Default(true) bool showLogin,
    @Default(false) bool tipCheckBox,
    String? currencySymbol,
  }) = _Default;
}
