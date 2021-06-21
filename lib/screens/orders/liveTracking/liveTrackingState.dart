import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/order_track_response/order_track_response.dart';

part 'liveTrackingState.freezed.dart';

@freezed
class LiveTrackingState with _$LiveTrackingState {
  const factory LiveTrackingState({
    @Default(false) bool isLoading,
    OrderTrackResponse? orderTrackResponse,
  }) = _Default;
}
