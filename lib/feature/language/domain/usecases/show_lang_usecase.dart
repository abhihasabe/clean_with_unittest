import 'package:clean_unittest/feature/language/domain/repositories/lang_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class ShowLangUseCase implements UseCaseOneInput<String, dynamic> {
  final LangRepository langRepository;

  ShowLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key) async {
    final dynamic apiResult = await langRepository.getThemeData(key);
    return Right(apiResult);
  }
}
