import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:fenix_user/common/allergen_images.dart';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/models/api_response_models/allergens_images/allergens_images.dart';
import 'package:fenix_user/screens/auth/login/login.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'database/db.dart';
import 'localization/localization.dart';
import 'models/api_response_models/language_response/language_response.dart';
import 'network/api_helper.dart';
import 'network/api_service.dart';

Map<String, Map<String, String>>? json;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load();
  await DB().initDatabase();
  await getLanguage();
  getAllergenImages();
  await getLocalizationData(API());
  WidgetsFlutterBinding.ensureInitialized();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://a3cdadaff8af49b88a2c430d9571d5e3@o1091520.ingest.sentry.io/6118974';
    },
  );
  final errorHandler = (FlutterErrorDetails errorDetails) {
    log('Error ${errorDetails.exception.toString()}', name: 'ERROR');
    Sentry.captureException(errorDetails.exception,
        stackTrace: errorDetails.stack);
  };
  FlutterError.onError = errorHandler;
  runZonedGuarded(() async {
    runApp(ProviderScope(child: MyApp()));
  }, (exception, stackTrace) {
    Sentry.captureException(exception, stackTrace: stackTrace);
  });
}

Future<LanguageResponse?> getLanguage() async {
  final res = await API().languages();
  if (res != null) {
    DB().saveLanguage(DB().getLanguage() ?? res.first.languageName);
    DB().saveLanguageCode(DB().getLanguageCode() ?? res.first.languageCode);
  } else {
    DB().saveLanguage(DB().getLanguage() ?? ' English');
    DB().saveLanguageCode(DB().getLanguageCode() ?? 'en');
  }
}

Future<List<AllergenImageModel>?> getAllergenImages() async {
  final res = await API().getAllergensImages();
  if (res != null) {
    LocalStoredAllergenImages().init(res);
  }
}

class MyApp extends HookWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: primary(),
      ),
      home: DB().isLoggedIn() ? HomeTabs() : LoginPage(),
      locale: Locale(DB().getLanguageCode() ?? 'en'),
      translations: Localization(json),
    );
  }
}

Future<Map<String, Map<String, String>>?> getLocalizationData(API api) async {
  final res = await api.getLocalizationData();
  if (res != null) {
    json = res;
  }
}
