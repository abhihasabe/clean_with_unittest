import 'package:clean_unittest/feature/language/domain/repositories/lang_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class AddLangUseCase implements UseCaseTwoInput<String, String, dynamic> {
  final LangRepository langRepository;

  AddLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key, value) async {
    final dynamic apiResult = await langRepository.addThemeData(key, value);
    return Right(apiResult);
  }
}
