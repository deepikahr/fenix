import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:restaurant_saas/localization/localization.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/auth/addNumber/addNumber.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/pre_auth/introScreen1.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocation.dart';
import 'package:restaurant_saas/styles/styles.dart';

import 'common/constant.dart';
import 'database/db.dart';
import 'models/api_response_models/currencyApiResponse/currencyApiResponse.dart';
import 'screens/categories/categories.dart';
import 'screens/home/homeTabs/homeTabs.dart';

final api = API();
final db = DB();
void main() async {
  await dotenv.load();
  await db.initDatabase();
  runApp(ProviderScope(child: EntryPage()));
  await getCurrency();
}

Future<void> initializeconfigLocalNotification() async {
  await configLocalNotification();
}

Future<void> updatePlayerId(playerId) async {
  if (db.isLoggedIn()) {
    await api.updateProfilePlyerId(playerId);
  }
}

Future<void> configLocalNotification() async {
  await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  await OneSignal.shared.setAppId(Constants.oneSignalKey);
  final allowed = await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);
  if (allowed) {
    var status =
        await (OneSignal.shared.getDeviceState() as FutureOr<OSDeviceState>);
    var playerId = status.userId;
    if (playerId != null) {
      await updatePlayerId(playerId);
      await db.savePlayerId(playerId);
    }
  }
}

Future<CurrencyApiResponse?> getCurrency() async {
  final res = await api.getCurrencyhData();
  if (res != null) {
    await db.saveCurrency(
        res.currencySetting?.currencySymbol, res.currencySetting?.currencyName);
  } else {
    await db.saveCurrency('Rs', 'India');
  }
}

class EntryPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          initializeconfigLocalNotification();
        });
      }
      return;
    }, const []);
    var isIntroScreen = db.getIntroductionScreen();
    var getLocalAddres = db.getLocalAddress();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        fontFamily: FONT_FAMILY,
        primaryColor: primary,
        accentColor: primary,
      ),
      home: Categories(),
      // home: GestureDetector(
      //   onTap: () {
      //     FocusScope.of(context).unfocus();
      //   },
      //   child: (isIntroScreen == true
      //       ? getLocalAddres != null
      //           ? HomeTabs()
      //           : PickLocation(backButton: false, isHomePage: true)
      //       : AddNumber()),
      // ),
      translations: Localization(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      defaultTransition: Transition.fadeIn,
    );
  }
}
