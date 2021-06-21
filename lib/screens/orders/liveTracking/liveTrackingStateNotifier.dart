import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/order_track_response/order_track_response.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'liveTrackingState.dart';

class LiveTrackingStateNotifier extends StateNotifier<LiveTrackingState> {
  final API api;
  LiveTrackingStateNotifier(this.api) : super(LiveTrackingState());

  Future<OrderTrackResponse?> fetchTrackingDetails(String orderId) async {
    state = state.copyWith(isLoading: true);
    final res = await api.orderTrack(orderId: orderId);
    state = state.copyWith(orderTrackResponse: res, isLoading: false);
    return res;
  }
}
