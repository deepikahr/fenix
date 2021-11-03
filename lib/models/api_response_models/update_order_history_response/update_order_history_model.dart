import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/update_order_socket_response/update_order_socket_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'update_order_history_model.freezed.dart';
part 'update_order_history_model.g.dart';

@freezed
class UpdateOrderHistoryModel
    with BaseModel<UpdateOrderHistoryModel>, _$UpdateOrderHistoryModel {
  const UpdateOrderHistoryModel._();

  const factory UpdateOrderHistoryModel({
    @JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
    @Default(ACTION_MODIFICATION.Pending)
        ACTION_MODIFICATION action,
    @JsonKey(name: '_id') String? id,
    DateTime? createdAt,
    Cart? localCart,
  }) = _UpdateOrderHistoryModel;

  factory UpdateOrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderHistoryModelFromJson(json);

  @override
  UpdateOrderHistoryModel fromMap(Map<String, dynamic> map) {
    return UpdateOrderHistoryModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
