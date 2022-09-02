import 'package:clean_unittest/core/manager/cache_manager.dart';
import 'package:clean_unittest/core/manager/http_client_manager.dart';
import 'package:clean_unittest/core/manager/local_db_manager.dart';
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
import 'package:clean_unittest/core/services/network/internet_info_imp.dart';
import 'package:clean_unittest/feature/domain/usecases/splash_usecase.dart';
import 'package:clean_unittest/core/services/network/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //BLOC
  getIt.registerFactory(() => SplashCubit(splashUseCase: getIt()));

  //USE CASES
  getIt.registerLazySingleton(() => SplashUseCase(splashRepository: getIt()));

  //REPOSITORIES
  getIt.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(
      remoteDataSource: getIt(),
      localDataStorage: getIt(),
      cacheDataStorage: getIt()));

  //SERVICES
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  getIt.registerLazySingleton<InternetInfo>(() => InternetInfoImp(checker: getIt()));

  getIt.registerLazySingleton<HttpClient>(() => HttpClientManager(client:getIt()));

  getIt.registerLazySingleton<LocalDB>(() => LocalDBManager());

  getIt.registerLazySingleton<Cache>(() => CacheManager());

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(httpClientManager: getIt()));

  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(localDB: getIt()));

  getIt.registerLazySingleton<CacheDataSource>(() => CacheDataSourceImpl(cache: getIt()));

  //! External
  getIt.registerLazySingleton(() => http.Client());
}
