import 'package:freezed_annotation/freezed_annotation.dart';

part 'ordersState.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    @Default(false) bool isLoading,
  }) = _Default;
}
