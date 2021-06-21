import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/order_details_resposne/order_details_reposne.dart';

part 'orderDetailsState.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState({
    @Default(true) bool isLoading,
    String? currencySymbol,
    OrderDetailsDataResponse? orderDetailsData,
  }) = _Default;
}
