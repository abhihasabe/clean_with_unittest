import 'package:clean_unittest/feature/language/presentation/bloc_cubits/lang_state.dart';
import 'package:clean_unittest/feature/language/domain/usecases/show_lang_usecase.dart';
import 'package:clean_unittest/feature/language/domain/usecases/add_lang_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LangCubit extends Cubit<LangState> {
  ShowLangUseCase? showLangUseCase;
  AddLangUseCase? addLangUseCase;
  static var langData;
  Locale? locale;

  LangCubit({this.locale}) : super(LangState());

  void updateLang() async {
    langData = addLangUseCase?.invoke("lang", "");
    if (langData != "") {
      locale = Locale(langData, '');
      emit(LangState(locale: Locale(langData, '')));
    } else {
      locale = Locale(ui.window.locale.toString().split('_')[0], '');
      emit(LangState(
          locale: Locale(ui.window.locale.toString().split('_')[0], '')));
    }
  }

  Future<void> changeLang(String langData) async {
    showLangUseCase?.invoke(langData);
    emit(LangState(locale: Locale(langData, '')));
    locale = Locale(langData, '');
  }
}
