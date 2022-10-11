import 'package:clean_unittest/feature/auth/domain/entities/reg_entity.dart';
import 'package:clean_unittest/feature/auth/domain/repositories/auth_repository.dart';
import 'package:clean_unittest/feature/auth/domain/entities/login_entity.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:clean_unittest/di/injection.dart';
import 'package:either_dart/src/either.dart';

class RegUseCase implements UseCaseOneInput<RegisterParams, RegEntity> {
  final AuthRepository authRepository;

  RegUseCase({required this.authRepository});

  @override
  Future<Either<Failure, RegEntity>> invoke(RegisterParams loginData) async {
    return await locator.get<AuthRepository>().register(loginData);
  }
}

class RegisterParams {
  String fName;
  String lName;
  String number;
  String email;
  String password;

  RegisterParams(
      {this.fName = "",
      this.lName = "",
      this.email = "",
      this.password = "",
      this.number = ""});
}
