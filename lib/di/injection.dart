import 'package:clean_unittest/feature/splash/data/data_sources/splash_data_source_impl.dart';
import 'package:clean_unittest/feature/splash/data/repositories/splash_repositorie_Imp.dart';
import 'package:clean_unittest/feature/splash/domain/repositories/splash_repositorie.dart';
import 'package:clean_unittest/feature/auth/data/data_sources/auth_data_source_impl.dart';
import 'package:clean_unittest/feature/splash/presentation/bloc_cubits/splash_cubit.dart';
import 'package:clean_unittest/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_unittest/feature/splash/data/data_sources/splash_data_source.dart';
import 'package:clean_unittest/feature/app/data/repositories/theme_repository_impl.dart';
import 'package:clean_unittest/feature/app/data/data_sources/app_data_source_impl.dart';
import 'package:clean_unittest/feature/auth/presentation/bloc_cubits/auth_cubit.dart';
import 'package:clean_unittest/feature/auth/domain/repositories/auth_repository.dart';
import 'package:clean_unittest/feature/auth/data/data_sources/auth_data_source.dart';
import 'package:clean_unittest/feature/app/domain/repositories/app_repository.dart';
import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_cubit.dart';
import 'package:clean_unittest/feature/app/domain/usecases/add_theme_usecase.dart';
import 'package:clean_unittest/feature/app/domain/usecases/get_theme_usecase.dart';
import 'package:clean_unittest/feature/splash/domain/usecases/splash_usecase.dart';
import 'package:clean_unittest/feature/app/data/data_sources/app_data_source.dart';
import 'package:clean_unittest/feature/app/domain/usecases/add_lang_usecase.dart';
import 'package:clean_unittest/feature/app/domain/usecases/get_lang_usecase.dart';
import 'package:clean_unittest/feature/auth/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/feature/auth/domain/usecases/reg_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:clean_unittest/core/manager/network_info_manager.dart';
import 'package:clean_unittest/core/manager/http_client_manager.dart';
import 'package:clean_unittest/core/manager/local_db_manager.dart';
import 'package:clean_unittest/core/manager/cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  await initGlobals();
  await initManagers();
  await initCubits();
  await initUseCases();
  await initRepositories();
  await initDataSources();
}

Future<void> initGlobals() async {
  locator.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  locator.registerLazySingleton<Future<SharedPreferences>>(
      () => SharedPreferences.getInstance());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Locale);
}

Future<void> initCubits() async {
  locator.registerFactory(() => AppCubit(
      getLangUseCase: locator(),
      addLangUseCase: locator(),
      addThemeUseCase: locator(),
      getThemeUseCase: locator(),
      cacheManager: locator()));
  locator.registerFactory(() => SplashCubit(splashUseCase: locator()));
  locator.registerFactory(
      () => AuthCubit(loginUseCase: locator(), regUseCase: locator()));
}

Future<void> initUseCases() async {
  locator.registerLazySingleton(() => GetLangUseCase(appRepository: locator()));
  locator
      .registerLazySingleton(() => AddThemeUseCase(appRepository: locator()));
  locator
      .registerLazySingleton(() => GetThemeUseCase(appRepository: locator()));
  locator.registerLazySingleton(() => AddLangUseCase(appRepository: locator()));
  locator
      .registerLazySingleton(() => SplashUseCase(splashRepository: locator()));
  locator.registerLazySingleton(() => LoginUseCase(loginRepository: locator()));
  locator.registerLazySingleton(() => RegUseCase(authRepository: locator()));
}

Future<void> initRepositories() async {
  locator.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(appDataSource: locator()));

  locator.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(splashDataSource: locator()));

  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: locator()));
}

Future<void> initDataSources() async {
  locator.registerLazySingleton<AppDataSource>(
      () => AppDataSourceImpl(cacheManager: locator()));

  locator.registerLazySingleton<SplashDataSource>(
      () => SplashDataSourceImpl(cache: locator()));

  locator.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(httpClientManager: locator()));
}

Future<void> initManagers() async {
  var sharedPrefs = await locator.get<Future<SharedPreferences>>();

  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoManager(connectionChecker: locator()));

  locator.registerLazySingleton<HttpClientManager>(
      () => HttpClientManagerImpl(initClient: locator()));

  locator.registerLazySingleton<LocalDBManager>(() => LocalDBManagerImpl());

  locator.registerLazySingleton<CacheManager>(
      () => CacheManagerImpl(initSharedPref: sharedPrefs));
}
