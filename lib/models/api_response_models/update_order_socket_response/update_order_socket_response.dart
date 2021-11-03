import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'update_order_socket_response.freezed.dart';
part 'update_order_socket_response.g.dart';

enum ACTION_MODIFICATION {
  @JsonValue('ACCEPTED')
  accept,
  @JsonValue('REJECTED')
  reject,
  @JsonValue('IN_PROGRESS')
  Pending,
}

@freezed
class UpdateOrderSocketResponse
    with BaseModel<UpdateOrderSocketResponse>, _$UpdateOrderSocketResponse {
  const UpdateOrderSocketResponse._();

  const factory UpdateOrderSocketResponse({
    @Default(ACTION_MODIFICATION.reject) ACTION_MODIFICATION action,
    @JsonKey(name: '_id') String? id,
    Cart? localCart,
  }) = _UpdateOrderSocketResponse;

  factory UpdateOrderSocketResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderSocketResponseFromJson(json);

  @override
  UpdateOrderSocketResponse fromMap(Map<String, dynamic> map) {
    return UpdateOrderSocketResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
