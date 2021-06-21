import 'package:freezed_annotation/freezed_annotation.dart';

part 'walletState.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(false) bool isLoading,
    @Default(0) num amount,
    String? currencySymbol,
  }) = _Default;
}
