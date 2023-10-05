import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums/shared_enums.dart';

@immutable
class SharedManager {
  static SharedPreferences? _sharedPreferences;

  SharedManager() {
    if (_sharedPreferences == null) initInstances();
  }

  Future<void> initInstances() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(SharedEnum key, String value) async {
    await _sharedPreferences!.setString(key.toString(), value);
  }

  Future<void> setBool(SharedEnum key, bool value) async {
    await _sharedPreferences!.setBool(key.toString(), value);
  }

  Future<String> getString(SharedEnum key) async {
    return _sharedPreferences!.getString(key.toString()) ?? '';
  }

  Future<bool> getBool(SharedEnum key) async {
    return _sharedPreferences!.getBool(key.toString()) ?? false;
  }

  Future<bool> clearAll() async {
    return await _sharedPreferences!.clear();
  }
}
