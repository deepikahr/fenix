import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_delivery_boy_chat_message_reponse/user_to_delivery_boy_chat_message_reponse.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'user_to_delivery_boy_chat_reponse.freezed.dart';
part 'user_to_delivery_boy_chat_reponse.g.dart';

@freezed
class UserToDeliveryBoyChatResponse
    with
        BaseModel<UserToDeliveryBoyChatResponse>,
        _$UserToDeliveryBoyChatResponse {
  const UserToDeliveryBoyChatResponse._();

  const factory UserToDeliveryBoyChatResponse({
    @JsonKey(name: '_id') String? id,
    String? deliveryBoyId,
    String? deliverBoyName,
    int? orderID,
    ORDER_STATUS? orderStatus,
    @Default([]) List<UserToDeliveryBoyChatMessageReponse> messages,
  }) = _UserToDeliveryBoyChatResponse;

  factory UserToDeliveryBoyChatResponse.fromJson(Map<String, dynamic> json) =>
      _$UserToDeliveryBoyChatResponseFromJson(json);

  @override
  UserToDeliveryBoyChatResponse fromMap(Map<String, dynamic> map) {
    return UserToDeliveryBoyChatResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
