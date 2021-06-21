import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_admin_chat_response/user_to_admin_chat_reponse.dart';

part 'userToAdminChatState.freezed.dart';

@freezed
class UserToAdminChatState with _$UserToAdminChatState {
  const factory UserToAdminChatState({
    @Default(true) bool isLoading,
    UserToAdminChatResponse? chatData,
    Profile? profile,
  }) = _Default;
}
