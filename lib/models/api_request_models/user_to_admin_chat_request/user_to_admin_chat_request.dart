import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'user_to_admin_chat_request.freezed.dart';
part 'user_to_admin_chat_request.g.dart';

@freezed
class UserToAdminChatRequest
    with BaseModel<UserToAdminChatRequest>, _$UserToAdminChatRequest {
  const UserToAdminChatRequest._();

  const factory UserToAdminChatRequest({
    String? userId,
    String? adminId,
    String? userName,
    String? orderId,
    String? message,
    String? sentBy,
  }) = _UserToAdminChatRequest;

  factory UserToAdminChatRequest.fromJson(Map<String, dynamic> json) =>
      _$UserToAdminChatRequestFromJson(json);

  @override
  UserToAdminChatRequest fromMap(Map<String, dynamic> map) {
    return UserToAdminChatRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
