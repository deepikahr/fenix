import 'package:fenix_user/screens/home_tabs/home_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'database/db.dart';
import 'localization/localization.dart';
import 'network/api_service.dart';

Map<String, Map<String, String>>? json;

void main() async {
  await dotenv.load();
  await DB().initDatabase();
  await getLocalizationData(API());
  runApp(ProviderScope(child: MyApp()));
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
      home: HomeTabs(),
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
