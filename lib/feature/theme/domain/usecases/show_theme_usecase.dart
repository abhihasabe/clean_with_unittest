import 'package:clean_unittest/feature/language/domain/repositories/lang_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:clean_unittest/feature/theme/domain/repositories/app_repository.dart';
import 'package:either_dart/src/either.dart';

class ShowThemeUseCase implements UseCaseOneInput<String, dynamic> {
  final ThemeRepository appRepository;

  ShowThemeUseCase({required this.appRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key) async {
    final dynamic apiResult = await appRepository.getThemeData(key);
    return Right(apiResult);
  }
}
