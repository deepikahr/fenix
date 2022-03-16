import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'dart:io';

class Constants {
  // app name
  static String appName = 'Pilarbox';

  // app name
  static String currency = '€';

  // restaurant name
  static String restaurantName = "GASTROBAR";

  // restaurant address
  static String restaurantAddress = "CALLE LARIOS 12";

  // delopy url production
  static String apiUrl = dotenv.env['API_URL']!;

  // ONE_SIGNAL_KEY
  static String oneSignalKey = dotenv.env['ONE_SIGNAL_KEY']!;

  // googleapikey
  static String googleMapApiKey = Platform.isIOS
      ? dotenv.env['IOS_GOOGLE_MAP_API_KEY']!
      : dotenv.env['ANDROID_GOOGLE_MAP_API_KEY']!;

  // PREDEFINED
  static String predefined = dotenv.env['PREDEFINED'] ?? 'false';

  // stripe key
  static String stripKey = dotenv.env['STRIPE_KEY']!;

  // image url
  static String imageUrlPath = dotenv.env['IMAGE_URL_PATH']!;

  static String emailVarification = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';

  static String mobileVerification = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static List notifyList = [
    'HELP_WITH_THE_NAPKIN_RACK',
    'ASK_SOMETHING',
    'REQUEST_NAPKINS',
    'OTHER'
  ];

  static List tipAmountList = [0, 0.25, 0.5, 1, 2];

  static List tipAmountEmojiList = ["", "🙂", "😊", "😉", "😍"];

  static List paymentList = [
    'PAY_IN_CASH',
    'PAY_WITH_DATAPHONE',
    'PAY_WITH_QR'
  ];
}
