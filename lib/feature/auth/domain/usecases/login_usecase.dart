import 'package:clean_unittest/feature/auth/domain/repositories/auth_repository.dart';
import 'package:clean_unittest/feature/auth/domain/entities/login_entity.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:clean_unittest/di/injection.dart';
import 'package:either_dart/src/either.dart';

class LoginUseCase implements UseCaseOneInput<LoginParams, LoginEntity> {
  final AuthRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, LoginEntity>> invoke(LoginParams loginData) async {
    return await locator.get<AuthRepository>().login(loginData);
  }
}

class LoginParams {
  String email;
  String password;

  LoginParams({this.email = "", this.password = ""});
}
