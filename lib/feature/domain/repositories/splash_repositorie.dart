import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class SplashRepository {
  Future<Either<Failure, dynamic>> getAuthData();
}