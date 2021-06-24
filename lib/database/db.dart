import 'dart:convert';

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

  Future<void> storeUserData(String token, String role, String id) async {
    final box = Hive.box('user');
    await box.putAll({'token': token, 'role': role, 'id': id});
  }

  String getToken() {
    final box = Hive.box('user');
    String token = box.get('token');
    return token;
  }

  String getRole() {
    final box = Hive.box('user');
    String role = box.get('role');
    return role;
  }

  String getId() {
    final box = Hive.box('user');
    String id = box.get('id');
    return id;
  }

  Future<void> logOut() async {
    final box = Hive.box('user');
    await box.delete('token');
    await box.delete('role');
    await box.delete('id');
  }

}
