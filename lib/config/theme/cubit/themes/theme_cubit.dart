import 'package:clean_unittest/config/theme/cubit/themes/theme_state.dart';
import 'package:clean_unittest/config/theme/app_theme.dart';
import 'package:clean_unittest/feature/domain/usecases/lang_usecase.dart';
import 'package:clean_unittest/feature/domain/usecases/theme_usecase.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:ui' as ui;

class ThemeCubit extends Cubit<ThemeState> {
  Brightness? currentBrightness;
  ThemeUseCase? themeUseCase;
  LangUseCase? langUseCase;
  static var themeData, langData;
  ThemeMode? themeMode;
  Locale? locale;

  ThemeCubit({this.themeUseCase, this.langUseCase})
      : super(const ThemeState()) {
    currentBrightness = AppThemes.currentSystemBrightness;
    updateAppTheme();
  }

  void updateAppTheme() {
    themeData = themeUseCase?.invoke("theme", "");
    if (themeData == "" && currentBrightness == Brightness.light) {
      setTheme(ThemeMode.light);
      updateLang(ThemeMode.light);
    } else if (themeData == "" && currentBrightness == Brightness.dark) {
      setTheme(ThemeMode.dark);
      updateLang(ThemeMode.dark);
    } else if (themeData == "light") {
      setTheme(ThemeMode.light);
      updateLang(ThemeMode.light);
    } else if (themeData == "dark") {
      setTheme(ThemeMode.dark);
      updateLang(ThemeMode.dark);
    }
  }

  void updateLang(ThemeMode themeMode) async {
    langData = themeUseCase?.invoke("lang", "");
    if (langData != "") {
      locale = Locale(langData, '');
      emit(ThemeState(themeMode: themeMode, locale: Locale(langData, '')));
    } else {
      locale = Locale(ui.window.locale.toString().split('_')[0], '');
      emit(ThemeState(
          themeMode: themeMode,
          locale: Locale(ui.window.locale.toString().split('_')[0], '')));
    }
  }

  void setTheme(ThemeMode themeMode) {
    themeMode == "dark"
        ? AppThemes.themeData(true)
        : AppThemes.themeData(false);
    emit(ThemeState(themeMode: themeMode, locale: locale));
    themeMode = themeMode;
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    try {
      themeData = await themeUseCase?.invoke("theme", themeMode.name);
      emit(ThemeState(themeMode: themeMode, locale: locale));
      themeMode = themeMode;
    } catch (e) {
      print(e);
    }
  }

/*
  Future<void> changeLang(String langData) async {
    themeUseCase?.init().then((value) {
      themeUseCase?.saveSelectedLang(langData);
    });
    emit(ThemeState(themeMode: themeMode, locale: Locale(langData, '')));
    locale = Locale(langData, '');
  }*/
}
