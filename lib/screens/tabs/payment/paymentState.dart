import 'package:freezed_annotation/freezed_annotation.dart';

part 'paymentState.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default(false) bool isLoading,
    @Default(0) int currentIndex,
  }) = _Default;
}
