import 'package:clean_unittest/feature/theme/domain/repositories/app_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class AddThemeUseCase implements UseCaseTwoInput<String, String, dynamic> {
  final ThemeRepository themeRepository;

  AddThemeUseCase({required this.themeRepository});

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
