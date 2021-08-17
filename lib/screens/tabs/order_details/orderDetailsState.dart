import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orderDetailsState.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState({
    @Default(false) bool isLoading,
    OrderDetailsResponse? orderDetails,
  }) = _Default;
}
