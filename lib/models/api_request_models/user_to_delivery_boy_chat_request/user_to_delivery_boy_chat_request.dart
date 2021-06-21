import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'user_to_delivery_boy_chat_request.freezed.dart';
part 'user_to_delivery_boy_chat_request.g.dart';

@freezed
class UserToDeliveryBoyChatRequest
    with
        BaseModel<UserToDeliveryBoyChatRequest>,
        _$UserToDeliveryBoyChatRequest {
  const UserToDeliveryBoyChatRequest._();

  const factory UserToDeliveryBoyChatRequest({
    String? userId,
    String? userName,
    String? orderId,
    String? message,
    String? sentBy,
    String? deliveryBoyId,
    String? deliverBoyName,
  }) = _UserToDeliveryBoyChatRequest;

  factory UserToDeliveryBoyChatRequest.fromJson(Map<String, dynamic> json) =>
      _$UserToDeliveryBoyChatRequestFromJson(json);

  @override
  UserToDeliveryBoyChatRequest fromMap(Map<String, dynamic> map) {
    return UserToDeliveryBoyChatRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
