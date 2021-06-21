import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/others/manageAddress/manageAddress.dart';
import 'package:restaurant_saas/screens/pre_auth/enterLocation/enterLocation.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/textFields.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/database/db.dart';

final db = DB();

// ignore: must_be_immutable
class LocationMap extends HookWidget {
  late GoogleMapController _controller;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final LatLng? initialLocation;
  final UserAddress? updatingUserAddress;
  final bool isUpdate;

  LocationMap({
    this.initialLocation,
    this.updatingUserAddress,
    this.isUpdate = false,
  });

  @override
  Widget build(BuildContext context) {
    final state = useProvider(locationMapProvider);
    final landMarkEditingController = useTextEditingController(
      text: updatingUserAddress?.landmark!,
    );
    final homeInfoEditingController = useTextEditingController(
      text: updatingUserAddress?.houseInfo!,
    );

    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(locationMapProvider.notifier).initializeLocation(
                latLng: initialLocation,
                userAddress: updatingUserAddress,
              );
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          state.address?.location != null || state.isLoading
              ? Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              state.address!.location!.coordinates[1],
                              state.address!.location!.coordinates[0],
                            ),
                            zoom: 13.5,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId('0'),
                              icon: BitmapDescriptor.defaultMarker,
                              position: LatLng(
                                state.address!.location!.coordinates[1],
                                state.address!.location!.coordinates[0],
                              ),
                            )
                          },
                          onMapCreated: (controller) async {
                            _controller = controller;
                          },
                          onTap: (coordinates) {
                            _controller.animateCamera(
                                CameraUpdate.newLatLng(coordinates));
                            context
                                .read(locationMapProvider.notifier)
                                .updateAddress(coordinates);
                          },
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (state.address != null)
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  color: light,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'lib/assets/icons/blackLocation.png',
                                            scale: 3,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: screenWidth(context) * 0.6,
                                            child: titleTextDarkLight2SmallBR(
                                                context,
                                                state.address!.address),
                                          ),
                                        ],
                                      ),
                                      flatPrimaryUnderlineButton(
                                          context, 'CHANGE'.tr, () {
                                        Get.to(() => EnterLocation());
                                      })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Container(
                          padding: EdgeInsets.all(16),
                          color: Colors.white,
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleTextDarkLightSmallBR(
                                    context, 'HOME_INFO'.tr),
                                SizedBox(
                                  height: 6,
                                ),
                                blockTextField(
                                  context,
                                  _textField(
                                      context, homeInfoEditingController),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                titleTextDarkLightSmallBR(
                                    context, 'LANDMARK'.tr),
                                SizedBox(
                                  height: 6,
                                ),
                                blockTextField(
                                  context,
                                  _textField(
                                      context, landMarkEditingController),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                titleTextDarkLightSmallBR(
                                    context, 'SAVE_AS'.tr),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: dark.withOpacity(0.04),
                                    border: Border.all(
                                        color: dark.withOpacity(0.16)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  height: 49,
                                  width: double.maxFinite,
                                  child: DropdownButton<String>(
                                    underline: Container(),
                                    isExpanded: true,
                                    value: state.address!.addressType,
                                    items: ['HOME', 'WORK', 'OTHERS']
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                              ),
                                              child: Text(
                                                e,
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (String? value) {
                                      context
                                          .read(locationMapProvider.notifier)
                                          .updateAddressType(value!);
                                    },
                                  ),
                                ),
                                SizedBox(height: 22),
                                primaryBlockButton(context, 'SAVE'.tr,
                                    () async {
                                  if (formKey.currentState!.validate()) {
                                    db.saveAddressValue(true);
                                    if (!isUpdate) {
                                      final res = await context
                                          .read(locationMapProvider.notifier)
                                          .addUserAddress(
                                            homeInfoEditingController.text,
                                            landMarkEditingController.text,
                                          );

                                      if (res != null) {
                                        await Get.offAll(() => HomeTabs());
                                      }
                                    } else {
                                      final res = await context
                                          .read(locationMapProvider.notifier)
                                          .updateUserAddress(
                                              homeInfoEditingController.text,
                                              landMarkEditingController.text);

                                      if (res != null) {
                                        await Get.off(() => ManageAddress());
                                      }
                                    }
                                  }
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: GFLoader(),
                ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/assets/icons/arrowBlock.png',
                      scale: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(BuildContext context, controller) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "This field can't be empty";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.all(16),
        border: InputBorder.none,
      ),
    );
  }

  Widget saveAsTextField(
      BuildContext context, TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      controller: controller,
      decoration: InputDecoration(
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.all(16),
        border: InputBorder.none,
      ),
    );
  }
}
