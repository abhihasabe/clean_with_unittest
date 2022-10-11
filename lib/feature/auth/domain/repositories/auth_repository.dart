import 'package:clean_unittest/feature/auth/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/feature/auth/domain/entities/login_entity.dart';
import 'package:clean_unittest/feature/auth/domain/usecases/reg_usecase.dart';
import 'package:clean_unittest/feature/auth/domain/entities/reg_entity.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(LoginParams loginData);

  Future<Either<Failure, RegEntity>> register(RegisterParams loginData);
}
