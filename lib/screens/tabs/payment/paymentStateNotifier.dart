import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'paymentState.dart';

class PaymentStateNotifier extends StateNotifier<PaymentState> {
  final API api;
  final DB db;
  PaymentStateNotifier(this.api, this.db) : super(PaymentState(isLoading: true));

  void onPageChanged(index) {
    state = state.copyWith(isLoading: true);
    state = state.copyWith.call(currentIndex: index);
    state = state.copyWith(isLoading: false);
  }

}
