import 'package:google_maps_webservice/geolocation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/location_utils.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/pre_auth/enterLocation/enterLocationState.dart';

class EnterLocationStateNotifier extends StateNotifier<EnterLocationState> {
  final API api;

  EnterLocationStateNotifier(this.api) : super(EnterLocationState());
  LocationUtils locationUtils = LocationUtils();

  Future<void> searchPlaces(String suggestion) async {
    if (suggestion.isEmpty) {
      state = state.copyWith.call(places: []);
    }

    var result = await locationUtils.getSuggestions(suggestion);

    if (result.length > 10) {
      result = result.sublist(0, 10);
    }

    state = state.copyWith.call(places: result);
  }

  Future<Location?> getLatLng(String placeId) async {
    state = state.copyWith.call(isLoading: true);
    final res = await locationUtils.getLatLngFromPlaceId(placeId);
    if (res == null) {
      state = state.copyWith.call(isLoading: false);
    }
    return res;
  }
}
