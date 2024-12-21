import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/core/services/shared_pref/pref_keys.dart';
import 'package:nova_store/core/services/shared_pref/shared_pref.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  // ----------------- Change Theme ------------------ //


  bool isDarkMode = false;
  void getTheme() {
    isDarkMode = SharedPref.getBoolean(PrefKeys.themeMode) ?? !isDarkMode;
    emit(AppState.themeChangedMode(isDark: isDarkMode));
  }

  Future<void> changeTheme() async {
    isDarkMode = !isDarkMode;
    await SharedPref.setBoolean(PrefKeys.themeMode, booleanValue: isDarkMode);
    emit(AppState.themeChangedMode(isDark: isDarkMode));
  }

  // ----------------- Change Language ------------------ //

  String currentLanguage = 'en';
  void getLanguage() {
    currentLanguage =
        SharedPref.getString(PrefKeys.language) ?? currentLanguage;
    emit(AppState.changeLanguage(language: Locale(currentLanguage)));
  }

  Future<void> changeLanguage() async {
    currentLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
    await SharedPref.setString(PrefKeys.language, currentLanguage);
    emit(AppState.changeLanguage(language: Locale(currentLanguage)));
  }
}
