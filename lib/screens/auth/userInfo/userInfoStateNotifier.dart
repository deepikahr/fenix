import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/auth/userInfo/userInfoState.dart';

class UserInfoStateNotifier extends StateNotifier<UserInfoState> {
  final API api;
  UserInfoStateNotifier(this.api) : super(UserInfoState());

  Future<List<String?>> submit(
      String firstName, String lastName, String email) async {
    state = state.copyWith.call(isLoading: true);

    final responses = await Future.wait(
        [api.updateMe(firstName, lastName), api.updateEmail(email)]);

    state = state.copyWith.call(isLoading: false);

    return responses;
  }
}
