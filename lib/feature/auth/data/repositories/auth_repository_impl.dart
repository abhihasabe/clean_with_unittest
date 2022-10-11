import 'package:clean_unittest/feature/auth/data/data_sources/auth_data_source.dart';
import 'package:clean_unittest/feature/auth/domain/entities/reg_entity.dart';
import 'package:clean_unittest/feature/auth/domain/repositories/auth_repository.dart';
import 'package:clean_unittest/feature/auth/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/feature/auth/domain/entities/login_entity.dart';
import 'package:clean_unittest/core/constants/app_network_constants.dart';
import 'package:clean_unittest/core/error/exceptions.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:clean_unittest/feature/auth/domain/usecases/reg_usecase.dart';
import 'package:either_dart/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource? authDataSource;

  AuthRepositoryImpl({this.authDataSource});

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParams loginData) async {
    // TODO: implement getLogin
    try {
      final uri = Uri.parse(
          AppNetworkConstants.BASE_URL + AppNetworkConstants.LOGIN_URL);

      var loginJson = {
        "username": loginData.email,
        "password": loginData.password
      };
      final loginResponse = await authDataSource?.login(loginJson, uri);
      if (loginResponse != null) {
        return Right(loginResponse.toEntity());
      } else {
        return Left(ServerFailure(message: 'Data Not Found'));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, RegEntity>> register(
      RegisterParams registerParams) async {
    // TODO: implement register
    try {
      final uri =
          Uri.parse(AppNetworkConstants.BASE_URL + AppNetworkConstants.REG_URL);

      var regJson = {
        "firstName": registerParams.fName,
        "lastName": registerParams.lName,
        "email": registerParams.email,
        "mobileNumber": registerParams.number,
        "password": registerParams.password
      };

      final regResponse = await authDataSource?.register(regJson, uri);
      if (regResponse != null) {
        return Right(regResponse.toEntity());
      } else {
        return Left(ServerFailure(message: 'Data Not Found'));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
