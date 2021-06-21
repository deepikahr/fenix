import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/others/profile/profileScreenState.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';
import 'package:restaurant_saas/network/api_service.dart';

import '../../../database/db.dart';

class ProfileScreenStateNotifier extends StateNotifier<ProfileScreenState> {
  final API api;
  final DB db;
  ProfileScreenStateNotifier(this.api, this.db)
      : super(ProfileScreenState(isLoading: true));

  Future<Profile?> getUserProfile() async {
    final address = await api.fetchUserProfile(autoErrorHandle: false);
    return address;
  }

  Future<void> fetchProfile() async {
    state = state.copyWith(isLoading: true);
    if (db.isLoggedIn() == true) {
      final profile = await getUserProfile();
      if (profile?.id != null) {
        state = state.copyWith(profile: profile);
        state = state.copyWith(isLoading: false, checkUserLogin: true);
      }
    } else {
      state = state.copyWith(isLoading: false, checkUserLogin: false);
    }
  }

  Future<void> logout() async {
    if (db.isLoggedIn()) {
      final response = await api.updateProfilePlyerId(null);
      if (response != null) {
        await db.logOut();
        state = state.copyWith(checkUserLogin: true);
        await Get.offAll(() => HomeTabs());
      }
    }
  }
}
