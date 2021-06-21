import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/location_utils.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocationState.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:get/get.dart';

class PickLocationStateNotifier extends StateNotifier<PickLocationState> {
  final API api;
  PickLocationStateNotifier(this.api) : super(PickLocationState());
  final locationUtils = LocationUtils();

  Future<Position> getDeviceLocation() async {
    state = state.copyWith.call(isLoading: true);

    final output = await locationUtils.getDeviceLocation();

    state = state.copyWith.call(isLoading: false);

    return output;
  }

  Future<void> checkLocation() async {
    state = state.copyWith.call(isLoading: true);
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      await customDialog(
        status: DIALOG_STATUS.FAIL,
        title: 'LOCATION_PERMISSIONS_ARE_DENIED'.tr,
      );
      state =
          state.copyWith.call(serviceEnabled: false, currenctLocation: false);
    } else {
      state = state.copyWith.call(serviceEnabled: true, currenctLocation: true);
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        state =
            state.copyWith.call(serviceEnabled: true, currenctLocation: false);
        await customDialog(
          status: DIALOG_STATUS.FAIL,
          title: 'LOCATION_PERMISSIONS_MESG'.tr,
        );
      } else if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          state = state.copyWith
              .call(serviceEnabled: true, currenctLocation: false);
          await customDialog(
            status: DIALOG_STATUS.FAIL,
            title:
                '${'LOCATION_PERMISSIONS_ARE_DENIED'.tr} (${'ACTUAL_VALUE'.tr} $permission).',
          );
        }
      }
    }
    state = state.copyWith.call(isLoading: false);
  }
}
