import 'package:freezed_annotation/freezed_annotation.dart';

part 'walletDialogState.freezed.dart';

@freezed
class WalletDialogState with _$WalletDialogState {
  const factory WalletDialogState({
    @Default(false) bool showWalletDesc,
    @Default(false) bool showAmountNeedToPay,
    @Default(0) double remainingAmountNeedToPay,
    @Default(0) double remainingWalletBalance,
    String? currencySymbol,
  }) = _Default;
}
