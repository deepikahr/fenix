import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip_waiter_state.freezed.dart';

@freezed
class TipWaiterState with _$TipWaiterState {
  const factory TipWaiterState({
    @Default(false) bool isLoading,
  }) = _Default;
}