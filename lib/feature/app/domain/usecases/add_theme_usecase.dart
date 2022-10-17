import 'package:clean_unittest/feature/app/domain/repositories/app_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class AddThemeUseCase implements UseCaseTwoInput<String, String, dynamic> {
  final AppRepository appRepository;

  AddThemeUseCase({required this.appRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(key, value) async {
    final dynamic apiResult = await appRepository.addThemeData(key, value);
    return Right(apiResult);
  }
}
