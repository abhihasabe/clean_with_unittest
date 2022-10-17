import 'package:clean_unittest/feature/app/domain/repositories/app_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class AddLangUseCase implements UseCaseTwoInput<String, String, dynamic> {
  final AppRepository appRepository;

  AddLangUseCase({required this.appRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key, value) async {
    final dynamic apiResult = await appRepository.addLangData(key, value);
    return Right(apiResult);
  }
}
