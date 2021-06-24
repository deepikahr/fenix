import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifyWaiterState.freezed.dart';

@freezed
class NotifyWaiterState with _$NotifyWaiterState {
  const factory NotifyWaiterState({
    @Default(false) bool isLoading,
  }) = _Default;
}
