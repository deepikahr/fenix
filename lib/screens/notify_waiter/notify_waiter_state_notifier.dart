import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/call_waiter_request/call_waiter_request.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/notify_waiter/notify_waiter_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifyWaiterStateNotifier extends StateNotifier<NotifyWaiterState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  NotifyWaiterStateNotifier(this.ref) : super(NotifyWaiterState());

  Future<String?> callWaiter(
      String? title, String? description, String? buttonName) async {
    state = state.copyWith.call(isRequestLoading: true, buttonName: buttonName);
    final CallWaiterRequest callWaiter = CallWaiterRequest(
      title: title,
      description: description,
      orderId: db.getOrderId(),
    );
    final response = await api.callWaiter(callWaiter);
    state = state.copyWith.call(isRequestLoading: false, buttonName: null);
    return response;
  }
}
