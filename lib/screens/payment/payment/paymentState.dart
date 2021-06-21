import 'package:freezed_annotation/freezed_annotation.dart';

part 'paymentState.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default(0) double totalWalletAmount,
    @Default(0) double usedWalletAmount,
    @Default(false) bool isLoading,
    String? currencySymbol,
  }) = _Default;
}
