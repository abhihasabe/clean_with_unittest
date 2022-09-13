import 'package:clean_unittest/core/constants/app_network_constants.dart';
import 'package:clean_unittest/feature/data/sources/cache_source/cache_source.dart';
import 'package:clean_unittest/feature/data/sources/local_source/local_source.dart';
import 'package:clean_unittest/feature/data/sources/remote_source/remote_source.dart';
import 'package:clean_unittest/feature/domain/repositories/login_repository.dart';
import 'package:clean_unittest/feature/domain/repositories/theme_repository.dart';
import 'package:clean_unittest/feature/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/core/error/exceptions.dart';
import 'package:clean_unittest/core/error/failure.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final RemoteDataSource? remoteDataSource;
  final LocalDataSource? localDataSource;
  final CacheDataSource? cacheDataSource;

  ThemeRepositoryImpl(
      {this.remoteDataSource, this.localDataSource, this.cacheDataSource});

  @override
  Future<dynamic> getThemeData(key) {
    // TODO: implement themeData
    return localDataSource!.get(key);
  }

  @override
  Future addThemeData(key, value) {
    // TODO: implement addThemeData
    return localDataSource!.post(key, value);
  }
}
