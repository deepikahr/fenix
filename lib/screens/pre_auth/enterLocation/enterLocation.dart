import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/location_utils.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_response_models/location/location.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/pre_auth/locationMap/locationMap.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/textFields.dart';

final db = DB();

// ignore: must_be_immutable
class EnterLocation extends HookWidget {
  Timer? timer;
  final bool isHomePage, isUpdate;

  EnterLocation({this.timer, this.isHomePage = false, this.isUpdate = false});

  final focusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    var locationUtils = LocationUtils();
    final locationTextFieldController = useTextEditingController();
    final state = useProvider(enterLocationProvider);

    useEffect(() {
      return timer?.cancel;
    }, const []);

    return Scaffold(
      appBar: titleAppbar(context, 'ENTER_LOCATION'.tr),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: blockTextField(
                  context,
                  locationTextField(
                      context, formKey, locationTextFieldController, focusNode,
                      (value) {
                    FocusScope.of(context).unfocus();
                    formKey.currentState!.validate();
                  }),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: titleTextDarkRegularBR(context, 'RECENTLY_USED'.tr),
              ),
              SizedBox(
                height: 6,
              ),
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.places.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        await context
                            .read(enterLocationProvider.notifier)
                            .getLatLng(state.places[index].placeId!)
                            .then((location) async {
                          if (isHomePage) {
                            var latLng = LatLng(location!.lat, location.lng);
                            final addressData = await locationUtils
                                .getAddressFromLatLng(latLng);
                            var address = UserAddress(
                              address: addressData.formattedAddress,
                              location: Location(
                                coordinates: [
                                  latLng.longitude,
                                  latLng.latitude
                                ],
                              ),
                            );
                            await db.saveLocalAddress(address);
                            await Get.offAll(() => HomeTabs());
                          } else {
                            await Get.to(
                              () => LocationMap(
                                initialLocation:
                                    LatLng(location!.lat, location.lng),
                                isUpdate: isUpdate,
                              ),
                            );
                          }
                        });
                      },
                      child: locationTile(
                        context,
                        state.places[index].description!,
                      ),
                    );
                  }),
            ],
          ),
          if (state.isLoading) Container(color: Colors.white, child: GFLoader())
        ],
      ),
    );
  }

  Widget locationTextField(BuildContext context, GlobalKey<FormFieldState> key,
      controller, FocusNode focusNode, ValueChanged<String> onSubmitted) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (String value) async {
        if (timer?.isActive ?? false) timer!.cancel();
        timer = Timer(Duration(milliseconds: 500), () {
          context.read(enterLocationProvider.notifier).searchPlaces(value);
        });
      },
      decoration: InputDecoration(
        labelText: 'ENTER_LOCATION'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }
}
