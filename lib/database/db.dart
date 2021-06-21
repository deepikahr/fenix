import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';

class DB {
  Future<void> initDatabase() async {
    await Hive.initFlutter();

    final secureStorage = const FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    var encryptionKey =
        base64Url.decode((await secureStorage.read(key: 'key'))!);
    await Hive.openBox('user', encryptionCipher: HiveAesCipher(encryptionKey));
  }

  void closeDatabase() async {
    await Hive.box('user').compact();
    await Hive.close();
  }

  Future<void> storeUserData(String? token, String? role, String? id) async {
    final box = Hive.box('user');
    await box.putAll({'token': token, 'role': role, 'id': id});
  }

  String? getToken() {
    final box = Hive.box('user');
    String? token = box.get('token');
    return token;
  }

  String? getRole() {
    final box = Hive.box('user');
    String? role = box.get('role');
    return role;
  }

  String? getId() {
    final box = Hive.box('user');
    String? id = box.get('id');
    return id;
  }

  Future<void> logOut() async {
    final box = Hive.box('user');
    await box.delete('token');
    await box.delete('role');
    await box.delete('id');
  }

  Future<void> saveIntroductionScreen(screen) async {
    final box = Hive.box('user');
    await box.put('introductionScreen', screen);
  }

  bool getIntroductionScreen() {
    final box = Hive.box('user');
    bool? introductionScreenValue = box.get('introductionScreen');
    return introductionScreenValue ?? false;
  }

  void saveUserValue(screen) {
    final box = Hive.box('user');
    box.put('UserValue', screen);
  }

  bool getUserValue() {
    final box = Hive.box('user');
    bool? userInfoValue = box.get('UserValue');
    return userInfoValue ?? false;
  }

  void saveAddressValue(screen) {
    final box = Hive.box('user');
    box.put('addressValue', screen);
  }

  bool getAddressValue() {
    final box = Hive.box('user');
    bool? addressValue = box.get('addressValue');
    return addressValue ?? false;
  }

  bool isLoggedIn() {
    final db = DB();
    final output = db.getToken() != null &&
        db.getUserValue() == true &&
        db.getAddressValue() == true;
    return output;
  }

  Future<void> savePlayerId(String playerId) async {
    final box = Hive.box('user');
    await box.putAll({'playerId': playerId});
  }

  String? getPlayerId() {
    final box = Hive.box('user');
    String? playerId = box.get('playerId');
    return playerId;
  }

  Future<void> storeFutureOrderTipData(
      double? futureTipAmount, bool? futureTipValue) async {
    final box = Hive.box('user');
    await box.putAll(
        {'futureTipAmount': futureTipAmount, 'futureTipValue': futureTipValue});
  }

  bool getFutureTipValue() {
    final box = Hive.box('user');
    bool futureTipValue = box.get('futureTipValue') ?? false;
    return futureTipValue;
  }

  double getFutureTipAmount() {
    final box = Hive.box('user');
    double futureTipAmount = box.get('futureTipAmount') ?? 0.0;
    return futureTipAmount;
  }

  Future<void> saveLocalAddress(UserAddress? userAddress) async {
    final box = Hive.box('user');
    await box.put('localAddress', json.encode(userAddress?.toJson()));
  }

  UserAddress? getLocalAddress() {
    final box = Hive.box('user');
    final address = box.get('localAddress');
    UserAddress? userAddress;
    if (address != null) {
      userAddress = UserAddress.fromJson(json.decode(address));
    }
    return userAddress;
  }

  Future<void> saveCurrency(
      String? currencySymbol, String? currencyName) async {
    final box = Hive.box('user');
    await box.putAll(
        {'currencySymbol': currencySymbol, 'currencyName': currencyName});
  }

  String getCurrencySymbol() {
    final box = Hive.box('user');
    String currencySymbol = box.get('currencySymbol');
    return currencySymbol;
  }
}
