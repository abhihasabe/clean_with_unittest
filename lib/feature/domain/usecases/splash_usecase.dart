import 'package:clean_unittest/feature/domain/repositories/splash_repositorie.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class SplashUseCase implements UseCaseNoInput<dynamic> {
  final SplashRepository? splashRepository;

  SplashUseCase({this.splashRepository});

  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await splashRepository!.getAuthData();
  }
}
