import 'package:clean_unittest/feature/app/domain/repositories/app_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class AppUseCase implements UseCaseTwoInput<String, String, dynamic> {
  final AppRepository themeRepository;

  AppUseCase({required this.themeRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key, value) async {
    final dynamic apiResult;
    if (value.isNotEmpty) {
      apiResult = await themeRepository.getThemeData(key);
    } else {
      apiResult = await themeRepository.addThemeData(key, value);
    }
    return Right(apiResult);
  }
}
