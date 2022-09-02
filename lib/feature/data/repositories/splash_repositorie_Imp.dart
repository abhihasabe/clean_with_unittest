import 'package:clean_unittest/feature/data/sources/remote_source/remote_source.dart';
import 'package:clean_unittest/feature/data/sources/cache_source/cache_source.dart';
import 'package:clean_unittest/feature/data/sources/local_source/local_source.dart';
import 'package:clean_unittest/feature/domain/repositories/splash_repositorie.dart';
import 'package:clean_unittest/core/error/exceptions.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class SplashRepositoryImpl implements SplashRepository {
  final RemoteDataSource? remoteDataSource;
  final LocalDataSource? localDataStorage;
  final CacheDataSource? cacheDataStorage;

  SplashRepositoryImpl(
      {this.remoteDataSource, this.localDataStorage, this.cacheDataStorage});

  @override
  Future<Either<Failure, dynamic>> getAuthData() async {
    // TODO: implement getAuthData
    try {
      final dynamic apiResult = cacheDataStorage?.getCacheAuthData();
      return Right(apiResult);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
