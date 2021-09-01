import 'package:fenix_user/models/api_request_models/payment_request/payment_request.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'payment_request_completed_response.freezed.dart';
part 'payment_request_completed_response.g.dart';

@freezed
class PaymentRequestCompletedResponse
    with
        BaseModel<PaymentRequestCompletedResponse>,
        _$PaymentRequestCompletedResponse {
  const PaymentRequestCompletedResponse._();

  const factory PaymentRequestCompletedResponse({
    @JsonKey(name: '_id') String? id,
    String? waiterId,
    PAYMENT_STATUS? paymentStatus,
    String? message,
    String? orderId,
    PAYMENT_TPES? paymentType,
  }) = _PaymentRequestCompletedResponse;

  factory PaymentRequestCompletedResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestCompletedResponseFromJson(json);

  @override
  PaymentRequestCompletedResponse fromMap(Map<String, dynamic> map) {
    return PaymentRequestCompletedResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
