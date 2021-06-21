import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_delivery_boy_response/user_to_delivery_boy_chat_reponse.dart';

part 'userToDeliveryBoyChatState.freezed.dart';

@freezed
class UserToDeliveryBoyChatState with _$UserToDeliveryBoyChatState {
  const factory UserToDeliveryBoyChatState({
    @Default(true) bool isLoading,
    UserToDeliveryBoyChatResponse? chatData,
    Profile? profile,
  }) = _Default;
}
