import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'no_backup_shared_preferences_platform_interface.dart';

class MethodChannelNoBackupSharedPreferences
    extends NoBackupSharedPreferencesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('no_backup_shared_preferences');

  @override
  Future<String?> getString(String key) async {
    return await methodChannel.invokeMethod<String>('getString', {'key': key});
  }

  @override
  Future<int?> getInt(String key) async {
    return await methodChannel.invokeMethod<int>('getInt', {'key': key});
  }

  @override
  Future<double?> getDouble(String key) async {
    return await methodChannel.invokeMethod<double>('getDouble', {'key': key});
  }

  @override
  Future<bool?> getBool(String key) async {
    return await methodChannel.invokeMethod<bool>('getBool', {'key': key});
  }

  @override
  Future<void> setString(String key, String value) async {
    await methodChannel.invokeMethod('setString', {'key': key, 'value': value});
  }

  @override
  Future<void> setInt(String key, int value) async {
    await methodChannel.invokeMethod('setInt', {'key': key, 'value': value});
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await methodChannel.invokeMethod('setDouble', {'key': key, 'value': value});
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await methodChannel.invokeMethod('setBool', {'key': key, 'value': value});
  }

  @override
  Future<bool> containsKey(String key) async {
    return await methodChannel
            .invokeMethod<bool>('containsKey', {'key': key}) ==
        true;
  }
}
