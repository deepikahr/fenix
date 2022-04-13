import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'payment_response.freezed.dart';
part 'payment_response.g.dart';

@freezed
class PaymentResponse with BaseModel<PaymentResponse>, _$PaymentResponse {
  const PaymentResponse._();

  const factory PaymentResponse({
    @JsonKey(name: '_id') String? id,
    int? orderID,
    String? message,
    String? qrCode,
  }) = _PaymentResponse;

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  @override
  PaymentResponse fromMap(Map<String, dynamic> map) {
    return PaymentResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
