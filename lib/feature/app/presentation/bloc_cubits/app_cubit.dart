import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_state.dart';
import 'package:clean_unittest/feature/app/domain/usecases/app_usecase.dart';
import 'package:clean_unittest/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:ui' as ui;

class AppCubit extends Cubit<AppState> {
  Brightness? currentBrightness;
  AppUseCase? addAppUseCase;
  static var themeData, langData;
  ThemeMode? themeMode;
  Locale? locale;

  AppCubit({this.addAppUseCase}) : super(const AppState()) {
    currentBrightness = AppThemes.currentSystemBrightness;
    updateAppTheme();
  }

  void updateAppTheme() {
    themeData = addAppUseCase?.invoke("theme", "");
    if (themeData == "" && currentBrightness == Brightness.light) {
      getThemeData(ThemeMode.light);
      getLangData(ThemeMode.light);
    } else if (themeData == "" && currentBrightness == Brightness.dark) {
      getThemeData(ThemeMode.dark);
      getLangData(ThemeMode.dark);
    } else if (themeData == "light") {
      getThemeData(ThemeMode.light);
      getLangData(ThemeMode.light);
    } else if (themeData == "dark") {
      getThemeData(ThemeMode.dark);
      getLangData(ThemeMode.dark);
    }
  }

  void getLangData(ThemeMode themeMode) async {
    langData = addAppUseCase?.invoke("lang", "");
    if (langData != "") {
      locale = Locale(langData, '');
      emit(AppState(themeMode: themeMode, locale: Locale(langData, '')));
    } else {
      locale = Locale(ui.window.locale.toString().split('_')[0], '');
      emit(AppState(
          themeMode: themeMode,
          locale: Locale(ui.window.locale.toString().split('_')[0], '')));
    }
  }

  void getThemeData(ThemeMode themeMode) {
    themeMode == "dark"
        ? AppThemes.themeData(true)
        : AppThemes.themeData(false);
    emit(AppState(themeMode: themeMode, locale: locale));
    themeMode = themeMode;
  }
}
