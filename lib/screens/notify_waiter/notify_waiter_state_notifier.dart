import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/call_waiter_request/call_waiter_request.dart';
import 'package:fenix_user/models/api_response_models/notification_response/notification_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/notify_waiter/notify_waiter_state.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';

class NotifyWaiterStateNotifier extends StateNotifier<NotifyWaiterState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  NotifyWaiterStateNotifier(this.ref) : super(NotifyWaiterState());

  Future<String?> callWaiter(String? title, String? description) async {
    if (db.getOrderId() != null) {
      state = state.copyWith.call(isLoading: true);
      final CallWaiterRequest callWaiter = CallWaiterRequest(
        title: title,
        description: description,
        orderId: db.getOrderId() ?? '',
      );
      final response = await api.callWaiter(callWaiter);
      state = state.copyWith.call(isLoading: false);
      return response;
    } else {
      customDialog(
        title: 'CREATE_ORDER_FIRST'.tr,
        status: DIALOG_STATUS.WARNING,
      );
    }
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
