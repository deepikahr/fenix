import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/location_utils.dart';
import 'package:restaurant_saas/models/api_response_models/location/location.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/pre_auth/enterLocation/enterLocation.dart';
import 'package:restaurant_saas/screens/pre_auth/locationMap/locationMap.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/textFields.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:restaurant_saas/database/db.dart';

final db = DB();

class PickLocation extends HookWidget {
  final bool backButton, isHomePage, isUpdate;

  PickLocation(
      {this.backButton = true, this.isHomePage = false, this.isUpdate = false});

  @override
  Widget build(BuildContext context) {
    var locationUtils = LocationUtils();

    final state = useProvider(pickLocationProvider);
    final controller = useTextEditingController();
    controller.text = state.selectedLocationText;
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(pickLocationProvider.notifier).checkLocation();
        });
      }
      return;
    }, const []);

    return Scaffold(
      appBar: !backButton
          ? titleAppbarWithOutBack(context, 'PICK_YOUR_LOCATION'.tr)
              as PreferredSizeWidget?
          : titleAppbar(context, 'PICK_YOUR_LOCATION'.tr),
      body: state.isLoading
          ? GFLoader()
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Image.asset('lib/assets/images/location.png'),
                      SizedBox(
                        height: 36,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => EnterLocation(
                                isHomePage: isHomePage, isUpdate: isUpdate),
                          );
                        },
                        child: blockTextField(
                          context,
                          locationTextField(context, controller),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      state.currenctLocation
                          ? Center(
                              child:
                                  titleTextDarkLight3SmallBR(context, 'or'.tr))
                          : Container(),
                      SizedBox(
                        height: 22,
                      ),
                      state.currenctLocation
                          ? primaryBlockButton(
                              context, 'USE_DEVICE_LOCATION'.tr, () async {
                              if (isHomePage) {
                                await context
                                    .read(pickLocationProvider.notifier)
                                    .getDeviceLocation()
                                    .then((location) async {
                                  var latLng = LatLng(
                                      location.latitude, location.longitude);
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
                                });
                              } else {
                                await Get.to(
                                    () => LocationMap(isUpdate: isUpdate));
                              }
                            })
                          : Container()
                    ],
                  ),
                ),
                if (state.isLoading) GFLoader()
              ],
            ),
    );
  }

  Widget locationTextField(
      BuildContext context, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      enabled: false,
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      decoration: InputDecoration(
        labelText: 'ENTER_LOCATION'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }
}
