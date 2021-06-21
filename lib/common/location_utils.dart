import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';

class LocationUtils {
  final places =
      GoogleMapsPlaces(apiKey: 'AIzaSyC-FAuGsHE8lPq2m-EalFISUt-845oHeGs');

  final geoCoding =
      GoogleMapsGeocoding(apiKey: 'AIzaSyC-FAuGsHE8lPq2m-EalFISUt-845oHeGs');

  Future<Position> getDeviceLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await customDialog(
        status: DIALOG_STATUS.FAIL,
        title: 'LOCATION_PERMISSIONS_ARE_DENIED'.tr,
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      await customDialog(
        status: DIALOG_STATUS.FAIL,
        title: 'LOCATION_PERMISSIONS_MESG'.tr,
      );
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        await customDialog(
          status: DIALOG_STATUS.FAIL,
          title:
              '${'LOCATION_PERMISSIONS_ARE_DENIED'.tr} (${'ACTUAL_VALUE'.tr} $permission).',
        );
      }
    }
    final res = await Geolocator.getCurrentPosition();
    return res;
  }

  Future<List<Prediction>> getSuggestions(suggestion) async {
    final res = await places.autocomplete(suggestion);

    var result = res.predictions.map((r) => r).toList();
    return result;
  }

  Future<String?> getAddressFromPlaceId(String placeId) async {
    final res = await places.getDetailsByPlaceId(placeId);
    return res.result.formattedAddress;
  }

  Future<Location?> getLatLngFromPlaceId(String placeId) async {
    final res = await places.getDetailsByPlaceId(placeId);
    return res.result.geometry?.location;
  }

  Future<GeocodingResult> getAddressFromLatLng(LatLng latlng) async {
    final res = await geoCoding.searchByLocation(
      Location(lat: latlng.latitude, lng: latlng.longitude),
    );
    return res.results.first;
  }
}
