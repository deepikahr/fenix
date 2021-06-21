import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'user_to_admin_chat_message_reponse.freezed.dart';
part 'user_to_admin_chat_message_reponse.g.dart';

@freezed
class UserToAdminChatMessageReponse
    with
        BaseModel<UserToAdminChatMessageReponse>,
        _$UserToAdminChatMessageReponse {
  const UserToAdminChatMessageReponse._();

  const factory UserToAdminChatMessageReponse({
    String? userId,
    String? userName,
    String? orderId,
    String? message,
    String? sentBy,
    String? adminId,
  }) = _UserToAdminChatMessageReponse;

  factory UserToAdminChatMessageReponse.fromJson(Map<String, dynamic> json) =>
      _$UserToAdminChatMessageReponseFromJson(json);

  @override
  UserToAdminChatMessageReponse fromMap(Map<String, dynamic> map) {
    return UserToAdminChatMessageReponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
