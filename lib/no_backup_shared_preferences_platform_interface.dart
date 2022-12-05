import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'no_backup_shared_preferences_method_channel.dart';

abstract class NoBackupSharedPreferencesPlatform extends PlatformInterface {
  NoBackupSharedPreferencesPlatform() : super(token: _token);

  static final Object _token = Object();
  static NoBackupSharedPreferencesPlatform _instance = MethodChannelNoBackupSharedPreferences();

  static NoBackupSharedPreferencesPlatform get instance => _instance;

  static set instance(NoBackupSharedPreferencesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getString(String key) async {
    throw UnimplementedError('getString() has not been implemented.');
  }

  Future<int?> getInt(String key) async {
    throw UnimplementedError('getInt() has not been implemented.');
  }

  Future<double?> getDouble(String key) async {
    throw UnimplementedError('getDouble() has not been implemented.');
  }

  Future<bool?> getBool(String key) async {
    throw UnimplementedError('getBool() has not been implemented.');
  }

  Future<void> setString(String key, String value) async {
    throw UnimplementedError('setString() has not been implemented.');
  }

  Future<void> setInt(String key, int value) async {
    throw UnimplementedError('setInt() has not been implemented.');
  }

  Future<void> setDouble(String key, double value) async {
    throw UnimplementedError('setDouble() has not been implemented.');
  }

  Future<void> setBool(String key, bool value) async {
    throw UnimplementedError('setBool() has not been implemented.');
  }

  Future<bool> containsKey(String key) async {
    throw UnimplementedError('containsKey() has not been implemented.');
  }
}
