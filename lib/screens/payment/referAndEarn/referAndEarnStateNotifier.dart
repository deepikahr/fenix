import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_response_models/referralDataResponse/referralDataResponse.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'referAndEarnState.dart';

class ReferAndEarnStateNotifier extends StateNotifier<ReferAndEarnState> {
  final API api;
  final DB db;
  ReferAndEarnStateNotifier(this.api, this.db)
      : super(ReferAndEarnState(isLoading: true));

  Future<ReferralDataResponse?> fetchReferralData() async {
    state = state.copyWith(isLoading: true);
    final res = await api.getReferralData();
    state = state.copyWith(
      referralData: res,
      isLoading: false,
      currencySymbol: db.getCurrencySymbol(),
    );
  }
}
