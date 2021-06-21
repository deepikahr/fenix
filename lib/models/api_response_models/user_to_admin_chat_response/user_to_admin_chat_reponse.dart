import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_admin_chat_message_reponse/user_to_admin_chat_message_reponse.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'user_to_admin_chat_reponse.freezed.dart';
part 'user_to_admin_chat_reponse.g.dart';

@freezed
class UserToAdminChatResponse
    with BaseModel<UserToAdminChatResponse>, _$UserToAdminChatResponse {
  const UserToAdminChatResponse._();

  const factory UserToAdminChatResponse({
    @JsonKey(name: '_id') String? id,
    String? adminId,
    int? orderID,
    ORDER_STATUS? orderStatus,
    @Default([]) List<UserToAdminChatMessageReponse> messages,
  }) = _UserToAdminChatResponse;

  factory UserToAdminChatResponse.fromJson(Map<String, dynamic> json) =>
      _$UserToAdminChatResponseFromJson(json);

  @override
  UserToAdminChatResponse fromMap(Map<String, dynamic> map) {
    return UserToAdminChatResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
