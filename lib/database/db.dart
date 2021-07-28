import 'dart:convert';
import 'dart:ui';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  Future<void> storeUserData(String token, String role, String id, String franchiseId, String vendorId) async {
    final box = Hive.box('user');
    await box.putAll({'token': token, 'role': role, 'id': id, 'franchiseId': franchiseId, 'vendorId': vendorId});
  }

  bool isLoggedIn() {
    final db = DB();
    final output = db.getToken() != null ? true : false;
    return output;
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

  String? getFranchiseId() {
    final box = Hive.box('user');
    String? franchiseId = box.get('franchiseId');
    return franchiseId;
  }

  String? getVendorId() {
    final box = Hive.box('user');
    String? vendorId = box.get('vendorId');
    return vendorId;
  }

  void saveMenuId(menuId) {
    final box = Hive.box('user');
    box.put('menuId', menuId);
  }

  String? getMenuId() {
    final box = Hive.box('user');
    String? menuId = box.get('menuId');
    return menuId;
  }

  void saveOrderId(orderId) {
    final box = Hive.box('user');
    box.put('orderId', orderId);
  }

  String? getOrderId() {
    final box = Hive.box('user');
    String? orderId = box.get('orderId');
    return orderId;
  }

  void saveOrderNumber(orderNumber) {
    final box = Hive.box('user');
    box.put('orderNumber', orderNumber);
  }

  String? getOrderNumber() {
    final box = Hive.box('user');
    String? orderNumber = box.get('orderNumber');
    return orderNumber;
  }

  void saveTableNumber(tableNumber) {
    final box = Hive.box('user');
    box.put('tableNumber', tableNumber);
  }

  String? getTableNumber() {
    final box = Hive.box('user');
    String? tableNumber = box.get('tableNumber');
    return tableNumber;
  }

  void saveMenuName(menuName) {
    final box = Hive.box('user');
    box.put('menuName', menuName);
  }

  String? getMenuName() {
    final box = Hive.box('user');
    String? menuName = box.get('menuName');
    return menuName;
  }

  void saveThemeColor(themeColor) {
    final box = Hive.box('user');
    box.put('themeColor', themeColor);
  }

  String? getThemeColor() {
    final box = Hive.box('user');
    String? themeColor = box.get('themeColor');
    return themeColor;
  }

  void saveType(type) {
    final box = Hive.box('user');
    box.put('type', type);
  }

  String? getType() {
    final box = Hive.box('user');
    String? type = box.get('type');
    return type;
  }

  void saveLanguageCode(code) {
    final box = Hive.box('user');
    box.put('code', code);
  }

  String? getLanguageCode() {
    final box = Hive.box('user');
    String? code = box.get('code');
    return code;
  }

  void saveLanguage(language) {
    final box = Hive.box('user');
    box.put('language', language);
  }

  String? getLanguage() {
    final box = Hive.box('user');
    String? language = box.get('language');
    return language;
  }

  Future<void> logOut() async {
    final box = Hive.box('user');
    await box.delete('token');
    await box.delete('role');
    await box.delete('id');
  }

}
