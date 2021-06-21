import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/screens/others/manageAddress/shimmerManageAddress.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/pre_auth/locationMap/locationMap.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocation.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ManageAddress extends HookWidget {
  final bool fromCartScreen;
  ManageAddress({this.fromCartScreen = false});

  @override
  Widget build(BuildContext context) {
    final state = useProvider(manageAddressProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(manageAddressProvider.notifier).fetchAddressList();
        });
      }
      return;
    }, const []);

    return Scaffold(
        backgroundColor: light,
        appBar: titleAppbar(context, 'MANAGE_ADDRESS'.tr),
        body: Stack(
          children: [
            ListView(children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: titleTextDark17RegularBR(context, 'SAVED_ADDRESSES'.tr),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.addressList.length,
                itemBuilder: (context, i) {
                  final address = state.addressList[i];
                  return addressBlock(
                      context,
                      address.addressType,
                      '${address.houseInfo}, ${address.address}',
                      address.isDefault,
                      (fromCartScreen ? 'SELECT'.tr : 'SET_AS_DEFAULT'.tr),
                      onEdit: () {
                    Get.to(() => LocationMap(
                          initialLocation: LatLng(
                            address.location!.coordinates[1],
                            address.location!.coordinates[0],
                          ),
                          updatingUserAddress: address,
                          isUpdate: true,
                        ));
                  }, onDelete: () {
                    if (state.addressList.length > 1) {
                      customDialog(
                        title:
                            '${'ARE_YOU_SURE'.tr} ? \n ${'CONFIRM_TO_DELETE_ADDRESS'.tr}',
                        onOkListener: () async {
                          Get.back();
                          await context
                              .read(manageAddressProvider.notifier)
                              .deleteAddress(address);
                        },
                      );
                    } else {
                      customDialog(
                        title: 'KEEP_ADDRESS_AT_LEAST_ONE'.tr,
                      );
                    }
                  }, onSetDefault: () {
                    context
                        .read(manageAddressProvider.notifier)
                        .setAsDefault(address);
                    if (fromCartScreen) {
                      Get.off(() => HomeTabs(
                            tabIndex: 2,
                          ));
                    } else {
                      Get.off(() => HomeTabs(
                            tabIndex: 0,
                          ));
                    }
                  });
                },
              ),
              addAddressButton(context)
            ]),
            if (state.isLoading)
              Container(
                color: Colors.white,
                child: shimmerManageAddress(),
              )
          ],
        ));
  }

  Widget addAddressButton(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: outlineButton(context, 'ADD_NEW_ADDRESS'.tr, () {
        Get.to(() => PickLocation());
      }),
    );
  }
}
