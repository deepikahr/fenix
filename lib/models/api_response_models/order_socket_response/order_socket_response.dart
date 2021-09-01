import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'order_socket_response.freezed.dart';
part 'order_socket_response.g.dart';

@freezed
class OrderSocketRequest
    with BaseModel<OrderSocketRequest>, _$OrderSocketRequest {
  const OrderSocketRequest._();

  const factory OrderSocketRequest({
    ORDER_STATUS? orderStatus,
  }) = _OrderSocketRequest;

  factory OrderSocketRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderSocketRequestFromJson(json);

  @override
  OrderSocketRequest fromMap(Map<String, dynamic> map) {
    return OrderSocketRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
