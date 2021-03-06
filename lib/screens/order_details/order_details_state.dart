import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_state.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState({
    @Default(false) bool isLoading,
    OrderDetailsResponse? orderDetails,
    @Default(false) bool divideAccount,
    @Default(0) int currentIndex,
  }) = _Default;
}
