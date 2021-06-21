import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/constant.dart';
import 'package:restaurant_saas/models/api_request_models/user_to_admin_chat_request/user_to_admin_chat_request.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_admin_chat_message_reponse/user_to_admin_chat_message_reponse.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/network/urls.dart';

import 'userToAdminChatState.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class UserToAdminChatStateNotifier extends StateNotifier<UserToAdminChatState> {
  final API api;
  UserToAdminChatStateNotifier(this.api) : super(UserToAdminChatState());
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

  Future<void> fetchChatDetails(orderId) async {
    final res = await api.getUserToAdminChatList(orderId);
    final profile = await getUserProfile();
    state = state.copyWith.call(chatData: res, profile: profile);
    state = state.copyWith(isLoading: false);
    listenSocket(profile);
  }

  void listenSocket(userData) {
    var listenTo = URL.ADMIN_SEND_MESSAGE_TO_USER_SOCKET_LISTEN +
        '${userData.id.toString()}';
    socket.on(listenTo, (data) {
      if (data != null) {
        var chatRequest = UserToAdminChatRequest.fromJson(data);
        var dataChat = UserToAdminChatMessageReponse(
          orderId: chatRequest.orderId,
          adminId: chatRequest.adminId,
          userId: chatRequest.userId,
          userName: chatRequest.userName,
          message: chatRequest.message,
          sentBy: chatRequest.sentBy,
        );
        state.chatData!.messages.add(dataChat);
        state = state.copyWith.call(chatData: state.chatData);
      }
    });
  }

  void sendMessage(chatData) {
    var emitFunction = URL.USER_SEND_MESSAGE_TO_ADMIN_SOCKET;
    socket.emit(emitFunction, chatData);
    var data = UserToAdminChatMessageReponse(
      orderId: chatData?.orderId,
      adminId: chatData?.adminId,
      userId: chatData?.userId,
      userName: chatData?.userName,
      message: chatData?.message,
      sentBy: chatData?.sentBy,
    );
    state.chatData!.messages.add(data);
    state = state.copyWith.call(chatData: state.chatData);
  }
}
