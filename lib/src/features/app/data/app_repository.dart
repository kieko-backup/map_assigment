import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:map_assignment/src/core/core.dart';

@injectable
class AppRepository with BaseRepository {
  final FlutterSecureStorage _storage;
  AppRepository(this._storage);


  Future<ThemeMode> themeMode() async {
    final indexString = await _storage.read(key: 'theme_mode');
    final index = int.tryParse(indexString ?? '') ?? 1;
    return ThemeMode.values[index];
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await _storage.write(key: 'theme_mode', value: theme.index.toString());
  }

  Future<String> languageCode() async {
    return (await _storage.read(key: 'language')) ?? Intl.getCurrentLocale();
  }

  Future<void> updateLanguage(String language) async {
    await _storage.write(key: 'language', value: language);
  }
}
