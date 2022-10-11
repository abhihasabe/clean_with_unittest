import 'package:clean_unittest/feature/splash/data/data_sources/splash_data_source.dart';
import 'package:clean_unittest/feature/splash/domain/repositories/splash_repositorie.dart';
import 'package:clean_unittest/core/error/exceptions.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashDataSource? splashDataSource;

  SplashRepositoryImpl({this.splashDataSource});

  @override
  Future<Either<Failure, dynamic>> getAuthData(key) async {
    // TODO: implement getAuthData
    try {
      final dynamic authData = splashDataSource?.getStringData(key);
      return Right(authData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
