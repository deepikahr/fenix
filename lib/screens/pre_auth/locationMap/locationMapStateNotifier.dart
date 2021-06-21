import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart' hide Location;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/location_utils.dart';
import 'package:restaurant_saas/models/api_response_models/location/location.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/pre_auth/locationMap/locationMapState.dart';

class LocationMapStateNotifier extends StateNotifier<LocationMapState> {
  final API api;
  LocationMapStateNotifier(this.api) : super(LocationMapState());

  final locationUtils = LocationUtils();

  Future<void> initializeLocation(
      {LatLng? latLng, UserAddress? userAddress}) async {
    if (latLng == null) {
      final location = await locationUtils.getDeviceLocation();
      latLng = LatLng(location.latitude, location.longitude);
    }

    if (userAddress == null) {
      final address = await locationUtils.getAddressFromLatLng(latLng);
      state = state.copyWith(
        address: UserAddress(
          address: address.formattedAddress,
          location: Location(
            coordinates: [latLng.longitude, latLng.latitude],
          ),
        ),
      );
    } else {
      state = state.copyWith(address: userAddress);
    }
  }

  Future<GeocodingResult> updateAddress(LatLng latlng) async {
    final address = await locationUtils.getAddressFromLatLng(latlng);

    state = state.copyWith(
      address: state.address!.copyWith(
        address: address.formattedAddress,
        location: Location(
          coordinates: [latlng.longitude, latlng.latitude],
        ),
      ),
    );

    return address;
  }

  Future<String?> addUserAddress(String houseInfo, String landmark) async {
    final res = await api.addAddress(
        state.address!.copyWith(houseInfo: houseInfo, landmark: landmark));

    return res;
  }

  Future<String?> updateUserAddress(String houseInfo, String landmark) async {
    state = state.copyWith(isLoading: true);
    final res = await api.updateAddress(
        state.address!.copyWith(houseInfo: houseInfo, landmark: landmark));
    state = state.copyWith(isLoading: false);
    return res;
  }

  void updateAddressType(String addressType) {
    state = state.copyWith(
      address: state.address!.copyWith(addressType: addressType),
    );
  }
}
