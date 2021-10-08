import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'order_response.freezed.dart';
part 'order_response.g.dart';

@freezed
class OrderResponse with BaseModel<OrderResponse>, _$OrderResponse {
  const OrderResponse._();

  const factory OrderResponse({
    @JsonKey(name: '_id') String? id,
    String? message,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  @override
  OrderResponse fromMap(Map<String, dynamic> map) {
    return OrderResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
