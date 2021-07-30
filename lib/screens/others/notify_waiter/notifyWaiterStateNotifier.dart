import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/call_waiter_request/call_waiter_request.dart';
import 'package:fenix_user/models/api_response_models/notification_list_response/notification_list_response.dart';
import 'package:fenix_user/models/api_response_models/notification_response/notification_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'notifyWaiterState.dart';

class NotifyWaiterStateNotifier extends StateNotifier<NotifyWaiterState> {
  final API api;
  final DB db;
  NotifyWaiterStateNotifier(this.api, this.db) : super(NotifyWaiterState(isLoading: true));

  Future<String?> callWaiter(String? title, String? description) async {
    state = state.copyWith.call(isLoading: true);

    final CallWaiterRequest callWaiter = CallWaiterRequest(
      title: title, description: description
    );

    final response = await api.callWaiter(callWaiter);
    state = state.copyWith.call(isLoading: false);
    return response;
  }

  Future<NotificationResponse?> fetchNotification() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.notificationList();
    state = state.copyWith.call(
      notification: response!,
      isLoading: false,
    );
  }


}
