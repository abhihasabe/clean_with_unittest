import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_state.dart';
import 'package:clean_unittest/feature/app/domain/usecases/get_theme_usecase.dart';
import 'package:clean_unittest/feature/app/domain/usecases/add_theme_usecase.dart';
import 'package:clean_unittest/feature/app/domain/usecases/get_lang_usecase.dart';
import 'package:clean_unittest/feature/app/domain/usecases/add_lang_usecase.dart';
import 'package:clean_unittest/core/constants/app_cache_constant.dart';
import 'package:clean_unittest/core/manager/cache_manager.dart';
import 'package:clean_unittest/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:ui' as ui;

class AppCubit extends Cubit<AppState> {
  Brightness? currentBrightness;
  GetLangUseCase getLangUseCase;
  AddLangUseCase addLangUseCase;
  AddThemeUseCase addThemeUseCase;
  GetThemeUseCase getThemeUseCase;
  static var themeData, langData;
  ThemeMode? themeMode;
  Locale? locale;
  CacheManager cacheManager;

  AppCubit(
      {required this.getLangUseCase,
      required this.addLangUseCase,
      required this.getThemeUseCase,
      required this.addThemeUseCase,
      required this.cacheManager})
      : super(const AppState()) {
    currentBrightness = AppThemes.currentSystemBrightness;
    getTheme();
  }

  void getTheme() async {
    var themeData = await getThemeUseCase.invoke(CacheConstants.theme);
    themeData.right == "dark"
        ? AppThemes.themeData(true)
        : AppThemes.themeData(false);
    getCurrentLang(themeData.right);
  }

  void getCurrentLang(themeData) async {
    ThemeMode selectedTheme =
        themeData == "dark" ? ThemeMode.dark : ThemeMode.light;
    getLangUseCase.invoke(CacheConstants.lang).then((langCode) {
      if (langCode.right.toString().isNotEmpty) {
        emit(AppState(
            locale: Locale(langCode.right, ''), themeMode: selectedTheme));
      } else {
        emit(AppState(
            locale: Locale(ui.window.locale.toString().split('_')[0], ''),
            themeMode: selectedTheme));
      }
    });
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    try {
      await addThemeUseCase.invoke(CacheConstants.theme, themeMode.name);
      var lang = await getLangUseCase.invoke(CacheConstants.lang);
      themeMode.name == "dark"
          ? AppThemes.themeData(true)
          : AppThemes.themeData(false);
      emit(AppState(locale: Locale(lang.right, ''), themeMode: themeMode));
    } catch (e) {
      print(e);
    }
  }

  Future<void> changeLang(String langData) async {
    try {
      await addLangUseCase.invoke(CacheConstants.lang, langData);
      var themes = await getThemeUseCase.invoke(CacheConstants.theme);
      ThemeMode selectedTheme =
          themes.right == "dark" ? ThemeMode.dark : ThemeMode.light;
      emit(AppState(locale: Locale(langData, ''), themeMode: selectedTheme));
    } catch (e) {
      print(e);
    }
  }
}
