import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_in_process_state.freezed.dart';

@freezed
class OrderInProcessState with _$OrderInProcessState {
  const factory OrderInProcessState({
    @Default(false) bool isLoading,
    OrderDetailsResponse? orderDetails,
  }) = _Default;
}
