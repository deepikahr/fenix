import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/constant.dart';
import 'package:restaurant_saas/models/api_request_models/user_to_delivery_boy_chat_request/user_to_delivery_boy_chat_request.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_delivery_boy_chat_message_reponse/user_to_delivery_boy_chat_message_reponse.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/network/urls.dart';

import 'userToDeliveryBoyChatState.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class UserToDeliveryBoyChatStateNotifier
    extends StateNotifier<UserToDeliveryBoyChatState> {
  final API api;
  UserToDeliveryBoyChatStateNotifier(this.api)
      : super(UserToDeliveryBoyChatState());
  var socket = io.io(Constants.apiUrl, <String, dynamic>{
    'transports': ['websocket']
  });

  Future<Profile?> getUserProfile() async {
    final address = await api.fetchUserProfile(autoErrorHandle: false);
    return address;
  }

  void socketConnectOrDisconnect(orderId) {
    state = state.copyWith(isLoading: true);
    socket.connect();
    socket.on('connect', (_) {
      print('Socket connected');
      fetchChatDetails(orderId);
    });
    socket.on('disconnect', (_) {
      socket.clearListeners();
      print('Socket Disconnected');
    });
    if (socket.connected) {
      socket.clearListeners();
      fetchChatDetails(orderId);
    }
  }

  void fetchChatDetails(orderId) async {
    final res = await api.getUserToDeliveryBoyChatList(orderId);
    final profile = await getUserProfile();
    state = state.copyWith.call(chatData: res, profile: profile);
    state = state.copyWith(isLoading: false);
    listenSocket(profile);
  }

  void listenSocket(userData) {
    var listenTo = URL.DELIVERY_BOY_SEND_MESSAGE_TO_USER_SOCKET_LISTEN +
        '${userData.id.toString()}';
    socket.on(listenTo, (data) {
      if (data != null) {
        var chatRequest = UserToDeliveryBoyChatRequest.fromJson(data);
        var dataChat = UserToDeliveryBoyChatMessageReponse(
          orderId: chatRequest.orderId,
          userId: chatRequest.userId,
          userName: chatRequest.userName,
          message: chatRequest.message,
          sentBy: chatRequest.sentBy,
          deliveryBoyId: chatRequest.deliveryBoyId,
          deliverBoyName: chatRequest.deliverBoyName,
        );
        state.chatData!.messages.add(dataChat);
        state = state.copyWith.call(chatData: state.chatData);
      }
    });
  }

  void sendMessage(chatData) {
    var emitFunction = URL.USER_SEND_MESSAGE_TO_DELIVERY_BOY_SOCKET;
    socket.emit(emitFunction, chatData);
    var data = UserToDeliveryBoyChatMessageReponse(
      orderId: chatData?.orderId,
      userId: chatData?.userId,
      userName: chatData?.userName,
      message: chatData?.message,
      sentBy: chatData?.sentBy,
      deliveryBoyId: chatData?.deliveryBoyId,
      deliverBoyName: chatData?.deliverBoyName,
    );
    state.chatData!.messages.add(data);
    state = state.copyWith.call(chatData: state.chatData);
  }
}
