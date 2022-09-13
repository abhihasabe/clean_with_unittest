import 'package:clean_unittest/feature/domain/repositories/login_repository.dart';
import 'package:clean_unittest/core/usecase/usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/src/either.dart';

class LoginUseCase implements UseCaseOneInput<User, dynamic> {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, dynamic>> invoke(User loginData) async {
    final dynamic apiResult = await loginRepository.userLogin(loginData);
    return Right(apiResult);
  }
}

class User {
  String email;
  String password;

  User({this.email = "", this.password = ""});
}
