import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:map_assignment/src/features/app/data/app_repository.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final AppRepository _repo;

  AppCubit(this._repo) : super(const AppState.initial());

  Future<void> loadSettings() async {
    final themeMode = await _repo.themeMode();
    final languageCode = await _repo.languageCode();
    emit(AppState.success(
      themeMode: themeMode,
      languageCode: languageCode,
    ));
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null || newThemeMode == state.themeMode) return;

    // Update ThemeMode
    emit(state.map(
      initial: (state) => state,
      success: (state) => state.copyWith(themeMode: newThemeMode),
    ));

    // Save ThemeMode into locale storage
    await _repo.updateThemeMode(newThemeMode);
  }

  Future<void> toggleThemeMode() async {
    // Update ThemeMode
    final themeMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.map(
      initial: (state) => state,
      success: (state) => state.copyWith(themeMode: themeMode),
    ));

    // Save ThemeMode into locale storage
    await _repo.updateThemeMode(themeMode);
  }

  Future<void> updateLanguage(String? newLanguage) async {
    if (newLanguage == null || newLanguage == state.languageCode) return;

    // Update ThemeMode
    emit(state.map(
      initial: (state) => state,
      success: (state) => state.copyWith(languageCode: newLanguage),
    ));

    // Save ThemeMode into locale storage
    await _repo.updateLanguage(newLanguage);
  }
}
