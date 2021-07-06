import 'package:freezed_annotation/freezed_annotation.dart';

part 'cartState.freezed.dart';

@freezed
class CartScreenState with _$CartScreenState {
  const factory CartScreenState({
    @Default(false) bool isLoading,
  }) = _Default;
}
