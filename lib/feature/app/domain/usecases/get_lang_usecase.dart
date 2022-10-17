import 'package:clean_unittest/feature/app/domain/repositories/app_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class GetLangUseCase implements UseCaseOneInput<String, dynamic> {
  final AppRepository appRepository;

  GetLangUseCase({required this.appRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key) async {
    final dynamic apiResult = await appRepository.getLangData(key);
    return Right(apiResult);
  }
}
