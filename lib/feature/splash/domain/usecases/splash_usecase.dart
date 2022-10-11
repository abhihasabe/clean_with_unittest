import 'package:clean_unittest/feature/splash/domain/repositories/splash_repositorie.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class SplashUseCase implements UseCaseOneInput<String, dynamic> {
  final SplashRepository? splashRepository;

  SplashUseCase({this.splashRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key) async {
    return await splashRepository!.getAuthData(key);
  }
}
