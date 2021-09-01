import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_in_processs_state.freezed.dart';

@freezed
class PaymentInProcessState with _$PaymentInProcessState {
  const factory PaymentInProcessState({
    @Default(false) bool isLoading,
  }) = _Default;
}
