
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'no_backup_shared_preferences_platform_interface.dart';

class NoBackupSharedPreferences {
  Future<String?> getString(String key) async {
    if (!kIsWeb && Platform.isAndroid) {
      if (!await NoBackupSharedPreferencesPlatform.instance.containsKey(key)) {
        return null;
      }
      return NoBackupSharedPreferencesPlatform.instance.getString(key);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    }
  }

  Future<int?> getInt(String key) async {
    if (!kIsWeb && Platform.isAndroid) {
      if (!await NoBackupSharedPreferencesPlatform.instance.containsKey(key)) {
        return null;
      }
      return NoBackupSharedPreferencesPlatform.instance.getInt(key);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(key);
    }
  }

  Future<double?> getDouble(String key) async {
    if (!kIsWeb && Platform.isAndroid) {
      if (!await NoBackupSharedPreferencesPlatform.instance.containsKey(key)) {
        return null;
      }
      return NoBackupSharedPreferencesPlatform.instance.getDouble(key);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(key);
    }
  }

  Future<bool?> getBool(String key) async {
    if (!kIsWeb && Platform.isAndroid) {
      if (!await NoBackupSharedPreferencesPlatform.instance.containsKey(key)) {
        return null;
      }
      return NoBackupSharedPreferencesPlatform.instance.getBool(key);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(key);
    }
  }

  Future<void> setString(String key, String value) async {
    if (!kIsWeb && Platform.isAndroid) {
      await NoBackupSharedPreferencesPlatform.instance.setString(key, value);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    }
  }

  Future<void> setInt(String key, int value) async {
    if (!kIsWeb && Platform.isAndroid) {
      await NoBackupSharedPreferencesPlatform.instance.setInt(key, value);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(key, value);
    }
  }

  Future<void> setDouble(String key, double value) async {
    if (!kIsWeb && Platform.isAndroid) {
      await NoBackupSharedPreferencesPlatform.instance.setDouble(key, value);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(key, value);
    }
  }

  Future<void> setBool(String key, bool value) async {
    if (!kIsWeb && Platform.isAndroid) {
      await NoBackupSharedPreferencesPlatform.instance.setBool(key, value);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
    }
  }

  Future<bool> containsKey(String key) async {
    if (!kIsWeb && Platform.isAndroid) {
      return await NoBackupSharedPreferencesPlatform.instance.containsKey(key);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.containsKey(key);
    }
  }
}
