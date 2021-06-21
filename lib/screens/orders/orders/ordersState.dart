import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';

part 'ordersState.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    @Default(false) bool isLoading,
    @Default(true) bool showUpcoming,
    @Default(false) bool showDelivered,
    @Default(0) int total,
    @Default(1) int pageNumber,
    @Default([]) List<Order> orders,
    String? currencySymbol,
  }) = _Default;
}
