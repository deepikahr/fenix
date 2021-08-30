import 'package:fenix_user/screens/auth/login/login.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'database/db.dart';
import 'localization/localization.dart';
import 'models/api_response_models/language_response/language_response.dart';
import 'network/api_service.dart';

Map<String, Map<String, String>>? json;

void main() async {
  await dotenv.load();
  await DB().initDatabase();
  await getLanguage();
  await getLocalizationData(API());
  runApp(ProviderScope(child: MyApp()));
}

Future<LanguageResponse?> getLanguage() async {
  final res = await API().languages();
  if (res != null) {
    DB().saveLanguage(DB().getLanguage() ?? res.first.languageName);
    DB().saveLanguageCode(DB().getLanguageCode() ?? res.first.languageCode);
  } else {
    DB().saveLanguage(DB().getLanguage() ?? 'English');
    DB().saveLanguageCode(DB().getLanguageCode() ?? 'en');
  }
}

class MyApp extends HookWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DB().isLoggedIn() ? HomeTabs() : LoginPage(),
      locale: Locale('en'),
      translations: Localization(json),
    );
  }
}

Future<Map<String, Map<String, String>>?> getLocalizationData(API api) async {
  final res = await api.getLocalizationData(Get.deviceLocale?.languageCode);
  if (res != null) {
    json = res;
  }
}
