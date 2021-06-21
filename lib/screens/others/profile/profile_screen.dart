import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/auth/addNumber/addNumber.dart';
import 'package:restaurant_saas/screens/orders/orders/orders_screen.dart';
import 'package:restaurant_saas/screens/others/cookie_screen/cookieScreen.dart';
import 'package:restaurant_saas/screens/others/editProfile/editProfile.dart';
import 'package:restaurant_saas/screens/others/favorites/favorites.dart';
import 'package:restaurant_saas/screens/others/htmlPage/htmlPageScreen.dart';
import 'package:restaurant_saas/screens/others/manageAddress/manageAddress.dart';
import 'package:restaurant_saas/screens/payment/referAndEarn/referAndEarn.dart';
import 'package:restaurant_saas/screens/payment/wallet/wallet.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/network_image.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import './profile_shimmer.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';
import 'package:restaurant_saas/database/db.dart';

final db = DB();

class ProfileScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(profileScreenProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(profileScreenProvider.notifier).fetchProfile();
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: light,
      appBar: commonAppbar(context, 'PROFILE'.tr),
      body: (state.isLoading)
          ? Container(color: Colors.white, child: shimmerProfile())
          : ListView(children: [
              if (state.checkUserLogin) profileInfo(context, state.profile!),
              profileLinks(context, state),
              linksBlock(context),
            ]),
    );
  }

  Widget profileInfo(BuildContext context, Profile profile) => Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8),
      child: GFListTile(
          onTap: () async {
            await Get.to(() => EditProfile(
                  profile: profile,
                ));

            await context.read(profileScreenProvider.notifier).fetchProfile();
          },
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(0),
          avatar: profile.profilePictureUrl == null
              ? Image.asset('lib/assets/icons/dp.png', scale: 3)
              : networkImage(
                  profile.profilePictureUrl,
                  70,
                  70,
                  50,
                ),
          title: titleTextDarkRegularBS(
              context, "${profile.firstName ?? ''} ${profile.lastName ?? ''}"),
          subTitle: titleTextDarkLightXSmallBR(context,
              '${profile.mobileNumber ?? ''} . ${profile.email ?? ''}'),
          icon: titleTextPrimarySmallBM(context, 'EDIT'.tr)));

  Widget profileLinks(BuildContext context, state) => Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          if (state.checkUserLogin)
            iconListTile(context, 'lib/assets/icons/profile/about.png',
                'MANAGE_ADDRESS'.tr, () {
              Get.to(() => ManageAddress());
            }),
          if (state.checkUserLogin)
            iconListTile(
                context, 'lib/assets/icons/profile/order.png', 'MY_ORDERS'.tr,
                () {
              Get.to(() => OrdersScreen());
            }),
          if (state.checkUserLogin)
            iconListTile(
                context, 'lib/assets/icons/profile/fav.png', 'FAVORITE'.tr, () {
              Get.to(() => Favorites());
            }),
          // iconListTile(context, 'lib/assets/icons/profile/coupon.png',
          //     'OFFERS'.tr, () {}),
          greyDivider(context),
          if (state.checkUserLogin)
            iconListTile(
                context, 'lib/assets/icons/profile/wallet.png', 'WALLET'.tr,
                () {
              Get.to(() => Wallet());
            }),
          if (state.checkUserLogin)
            iconListTile(context, 'lib/assets/icons/profile/cookie.png',
                'COOKIE_POINT'.tr, () => Get.to(() => CookieScreen())),
          if (state.checkUserLogin)
            iconListTile(context, 'lib/assets/icons/profile/friend.png',
                'REFER_A_FRIEND'.tr, () => Get.to(() => ReferAndEarn())),
          greyDivider(context),
          iconListTile(
              context, 'lib/assets/icons/profile/help.png', 'PROFILE_HELP'.tr,
              () {
            Get.to(() => HtmlPageScreen(isHelp: true));
          }),
          iconListTile(
              context, 'lib/assets/icons/profile/about.png', 'ABOUT_US'.tr, () {
            Get.to(() => HtmlPageScreen(isAboutUs: true));
          }),
          iconListTile(context, 'lib/assets/icons/profile/logout.png',
              state.checkUserLogin ? 'LOGOUT'.tr : 'PROFILE_LOGIN'.tr, () {
            if (state.checkUserLogin) {
              context.read(profileScreenProvider.notifier).logout();
            } else {
              Get.to(() => AddNumber());
            }
          }),
        ],
      ));

  Widget linksBlock(context) => Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => HtmlPageScreen(isTermsAndCondition: true));
              },
              child: Text(
                'TERMS_AND_CONDITIONS'.tr,
                style: textPrimarySmallBSLineThrough(context),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => HtmlPageScreen(isProvacyPolicy: true));
              },
              child: Text(
                'PRIVACY_POLICY'.tr,
                style: textPrimarySmallBSLineThrough(context),
              ),
            )
          ],
        ),
      );
}
