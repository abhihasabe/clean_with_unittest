import 'package:clean_unittest/config/theme/cubit/themes/theme_cubit.dart';
import 'package:clean_unittest/core/manager/cache_manager.dart';
import 'package:clean_unittest/core/manager/http_client_manager.dart';
import 'package:clean_unittest/core/manager/local_db_manager.dart';
import 'package:clean_unittest/core/manager/network_info_manager.dart';
import 'package:clean_unittest/feature/data/repositories/login_repository_impl.dart';
import 'package:clean_unittest/feature/data/repositories/theme_repository_impl.dart';
import 'package:clean_unittest/feature/domain/repositories/login_repository.dart';
import 'package:clean_unittest/feature/domain/repositories/theme_repository.dart';
import 'package:clean_unittest/feature/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/feature/domain/usecases/theme_usecase.dart';
import 'package:clean_unittest/feature/presentation/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:clean_unittest/feature/presentation/bloc_cubits/splash_cubit/splash_cubit.dart';
import 'package:clean_unittest/feature/data/sources/remote_source/remote_source_impl.dart';
import 'package:clean_unittest/feature/data/sources/local_source/local_source_impl.dart';
import 'package:clean_unittest/feature/data/sources/cache_source/cache_source_impl.dart';
import 'package:clean_unittest/feature/data/sources/remote_source/remote_source.dart';
import 'package:clean_unittest/feature/data/repositories/splash_repositorie_Imp.dart';
import 'package:clean_unittest/feature/data/sources/cache_source/cache_source.dart';
import 'package:clean_unittest/feature/data/sources/local_source/local_source.dart';
import 'package:clean_unittest/feature/domain/repositories/splash_repositorie.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:clean_unittest/feature/domain/usecases/splash_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await initGlobals();
  await initCubits();
  await initUseCases();
  await initRepositories();
  await initDataSources();
  await initDataManagers();
}

Future<void> initGlobals() async {
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  getIt.registerLazySingleton<Future<SharedPreferences>>(
      () => SharedPreferences.getInstance());
  getIt.registerLazySingleton(() => http.Client());
}

Future<void> initCubits() async {
  getIt.registerFactory(() => ThemeCubit(themeUseCase: getIt()));
  getIt.registerFactory(() => SplashCubit(splashUseCase: getIt()));
  getIt.registerFactory(
      () => LoginCubit(loginUseCase: getIt(), cacheDataSource: getIt()));
}

Future<void> initUseCases() async {
  getIt.registerLazySingleton(() => ThemeUseCase(themeRepository: getIt()));
  getIt.registerLazySingleton(() => SplashUseCase(splashRepository: getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(loginRepository: getIt()));
}

Future<void> initRepositories() async {
  getIt.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      cacheDataSource: getIt()));

  getIt.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      cacheDataSource: getIt()));

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      cacheDataSource: getIt()));
}

Future<void> initDataSources() async {
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(httpClientManager: getIt()));

  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(localDBManager: getIt()));

  getIt.registerLazySingleton<CacheDataSource>(
      () => CacheDataSourceImpl(cache: getIt()));
}

Future<void> initDataManagers() async {
  var sharedPrefs = await getIt.get<Future<SharedPreferences>>();

  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoManager(connectionChecker: getIt()));

  getIt.registerLazySingleton<HttpClientManager>(
      () => HttpClientManagerImpl(initClient: getIt()));

  getIt.registerLazySingleton<LocalDBManager>(() => LocalDBManagerImpl());

  getIt.registerLazySingleton<CacheManager>(
      () => CacheManagerImpl(initSharedPref: sharedPrefs));
}
