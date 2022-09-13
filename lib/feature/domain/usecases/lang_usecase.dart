import 'package:clean_unittest/feature/domain/repositories/theme_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class LangUseCase implements UseCaseTwoInput<String, String, dynamic> {
  final ThemeRepository themeRepository;

  LangUseCase({required this.themeRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key, value) async {
    final dynamic apiResult = await themeRepository.addThemeData(key, value);
    return Right(apiResult);
  }
}
