import 'package:clean_unittest/feature/data/sources/remote_source/remote_source.dart';
import 'package:clean_unittest/feature/data/sources/cache_source/cache_source.dart';
import 'package:clean_unittest/feature/data/sources/local_source/local_source.dart';
import 'package:clean_unittest/feature/domain/repositories/splash_repositorie.dart';
import 'package:clean_unittest/core/error/exceptions.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class SplashRepositoryImpl implements SplashRepository {
  final RemoteDataSource? remoteDataSource;
  final LocalDataSource? localDataSource;
  final CacheDataSource? cacheDataSource;

  SplashRepositoryImpl(
      {this.remoteDataSource, this.localDataSource, this.cacheDataSource});

  @override
  Future<Either<Failure, dynamic>> getAuthData(key) async {
    // TODO: implement getAuthData
    try {
      final dynamic authData = cacheDataSource?.getStringData(key);
      return Right(authData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
