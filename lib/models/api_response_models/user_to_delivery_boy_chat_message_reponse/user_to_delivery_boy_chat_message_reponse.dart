import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'user_to_delivery_boy_chat_message_reponse.freezed.dart';
part 'user_to_delivery_boy_chat_message_reponse.g.dart';

@freezed
class UserToDeliveryBoyChatMessageReponse
    with
        BaseModel<UserToDeliveryBoyChatMessageReponse>,
        _$UserToDeliveryBoyChatMessageReponse {
  const UserToDeliveryBoyChatMessageReponse._();

  const factory UserToDeliveryBoyChatMessageReponse({
    String? userId,
    String? userName,
    String? orderId,
    String? message,
    String? sentBy,
    String? deliveryBoyId,
    String? deliverBoyName,
  }) = _UserToDeliveryBoyChatMessageReponse;

  factory UserToDeliveryBoyChatMessageReponse.fromJson(
          Map<String, dynamic> json) =>
      _$UserToDeliveryBoyChatMessageReponseFromJson(json);

  @override
  UserToDeliveryBoyChatMessageReponse fromMap(Map<String, dynamic> map) {
    return UserToDeliveryBoyChatMessageReponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
