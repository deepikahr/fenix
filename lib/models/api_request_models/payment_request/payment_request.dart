import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'payment_request.freezed.dart';
part 'payment_request.g.dart';

enum PAYMENT_TPES {
  @JsonValue('PAY_IN_CASH')
  payInCash,
  @JsonValue('PAY_WITH_CARD')
  payWithCard,
  @JsonValue('NFC')
  nfc,
}

@freezed
class PaymentRequest with BaseModel<PaymentRequest>, _$PaymentRequest {
  const PaymentRequest._();

  const factory PaymentRequest({
    String? orderId,
    PAYMENT_TPES? paymentType,
    int? tableNumber,
    double? amount,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);

  @override
  PaymentRequest fromMap(Map<String, dynamic> map) {
    return PaymentRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
