import 'package:clean_unittest/feature/theme/presentation/bloc_cubits/theme_state.dart';
import 'package:clean_unittest/feature/theme/domain/usecases/add_theme_usecase.dart';
import 'package:clean_unittest/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:ui' as ui;

class ThemeCubit extends Cubit<ThemeState> {
  Brightness? currentBrightness;
  AddThemeUseCase? addAppUseCase;
  static var themeData, langData;
  ThemeMode? themeMode;
  Locale? locale;

  ThemeCubit({this.addAppUseCase}) : super(const ThemeState()) {
    currentBrightness = AppThemes.currentSystemBrightness;
    updateAppTheme();
  }

  void updateAppTheme() {
    themeData = addAppUseCase?.invoke("theme", "");
    if (themeData == "" && currentBrightness == Brightness.light) {
      getThemeData(ThemeMode.light);
    } else if (themeData == "" && currentBrightness == Brightness.dark) {
      getThemeData(ThemeMode.dark);
    } else if (themeData == "light") {
      getThemeData(ThemeMode.light);
    } else if (themeData == "dark") {
      getThemeData(ThemeMode.dark);
    }
  }

  void getThemeData(ThemeMode themeMode) {
    themeMode == "dark" ? AppThemes.themeData(true) : AppThemes.themeData(false);
    emit(ThemeState(themeMode: themeMode));
    themeMode = themeMode;
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    try {
      themeData = await addAppUseCase?.invoke("theme", themeMode.name);
      emit(ThemeState(themeMode: themeMode));
      themeMode = themeMode;
    } catch (e) {
      print(e);
    }
  }

/*Future<void> changeLang(String langData) async {
    showAppUseCase?.invoke(langData);
    emit(AppState(themeMode: themeMode, locale: Locale(langData, '')));
    locale = Locale(langData, '');
  }*/
}
