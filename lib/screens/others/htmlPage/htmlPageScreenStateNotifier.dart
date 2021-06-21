import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/htmlDataReponse/htmlDataReponse.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'htmlPageScreenState.dart';

class HtmlPageScreenStateNotifier extends StateNotifier<HtmlPageScreenState> {
  final API api;
  HtmlPageScreenStateNotifier(this.api) : super(HtmlPageScreenState());

  Future<HtmlDataReponse?> fetchAboutUs() async {
    state = state.copyWith(isLoading: true);
    final res = await api.getAboutUsData();
    state = state.copyWith(data: res, isLoading: false);
  }

  Future<HtmlDataReponse?> fetchTermsAndCondition() async {
    state = state.copyWith(isLoading: true);
    final res = await api.getTermsAndConditionData();
    state = state.copyWith(data: res, isLoading: false);
  }

  Future<HtmlDataReponse?> fetchPrivacyPolicy() async {
    state = state.copyWith(isLoading: true);
    final res = await api.getPrivacyData();
    state = state.copyWith(data: res, isLoading: false);
  }

  Future<HtmlDataReponse?> fetchHelp() async {
    state = state.copyWith(isLoading: true);
    final res = await api.getHelpData();
    state = state.copyWith(data: res, isLoading: false);
  }
}
