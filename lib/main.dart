import 'dart:async';

import 'package:fenix_user/screens/auth/login/login.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/settings/settings.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'common/constant.dart';
import 'database/db.dart';
import 'localization/localization.dart';
import 'network/api_service.dart';

final api = API();
final db = DB();
void main() async {
  await dotenv.load();
  await db.initDatabase();
  runApp(ProviderScope(child: EntryPage()));
  // await getCurrency();
}

Future<void> initializeconfigLocalNotification() async {
  await configLocalNotification();
}

Future<void> updatePlayerId(playerId) async {
  // if (db.isLoggedIn()) {
  //   await api.updateProfilePlyerId(playerId);
  // }
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
      // await db.savePlayerId(playerId);
    }
  }
}

// Future<CurrencyApiResponse?> getCurrency() async {
//   final res = await api.getCurrencyhData();
//   if (res != null) {
//     await db.saveCurrency(
//         res.currencySetting?.currencySymbol, res.currencySetting?.currencyName);
//   } else {
//     await db.saveCurrency('Rs', 'India');
//   }
// }

class EntryPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        db.saveThemeColor('red');
        Future.delayed(Duration.zero, () {
          initializeconfigLocalNotification();
        });
      }
      return;
    }, const []);
    // var isIntroScreen = db.getIntroductionScreen();
    // var getLocalAddres = db.getLocalAddress();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        fontFamily: FONT_FAMILY,
        primaryColor: primary,
        accentColor: primary,
      ),
      // home: Categories(),
      home: db.isLoggedIn() && db.getMenuName() != null ? HomeTabs() :
      db.isLoggedIn() && db.getMenuName() == null  ? Settings() : LoginPage(),
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

