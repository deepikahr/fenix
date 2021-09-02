import 'package:freezed_annotation/freezed_annotation.dart';

part 'notify_waiter_state.freezed.dart';

@freezed
class NotifyWaiterState with _$NotifyWaiterState {
  const factory NotifyWaiterState({
    @Default(false) bool isLoading,
    @Default(false) bool isRequestLoading,
    String? buttonName,
  }) = _Default;
}
