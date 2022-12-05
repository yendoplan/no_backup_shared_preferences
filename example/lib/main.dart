import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:no_backup_shared_preferences/no_backup_shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _value = 0;
  bool _boolValue = false;
  final _noBackupSharedPreferencesPlugin = NoBackupSharedPreferences();

  void _saveRandom() async {
    await _noBackupSharedPreferencesPlugin.setInt(
        'testkey', Random().nextInt(255));
  }

  void _toggleBoolean() async {
    await _noBackupSharedPreferencesPlugin.setBool('testboolkey', !_boolValue);
  }

  void _readValues() async {
    _value = await _noBackupSharedPreferencesPlugin.getInt('testkey') ?? 0;
    _boolValue =
        (await _noBackupSharedPreferencesPlugin.getBool('testboolkey'))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text('Current values:\n$_value\n$_boolValue', textAlign: TextAlign.center,),
              ),
              ElevatedButton(
                  onPressed: () {
                    _saveRandom();
                  },
                  child: const Text('Save random int value')),
              ElevatedButton(
                  onPressed: () {
                    _toggleBoolean();
                  },
                  child: const Text('Toggle boolean')),
              ElevatedButton(
                  onPressed: () {
                    _readValues();
                  },
                  child: const Text('Read saved values')),
            ],
          ),
        ),
      ),
    );
  }
}
