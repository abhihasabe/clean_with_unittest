import 'package:clean_unittest/core/constants/app_network_constants.dart';
import 'package:clean_unittest/feature/data/sources/cache_source/cache_source.dart';
import 'package:clean_unittest/feature/data/sources/local_source/local_source.dart';
import 'package:clean_unittest/feature/data/sources/remote_source/remote_source.dart';
import 'package:clean_unittest/feature/domain/repositories/login_repository.dart';
import 'package:clean_unittest/feature/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/core/error/exceptions.dart';
import 'package:clean_unittest/core/error/failure.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteDataSource? remoteDataSource;
  final LocalDataSource? localDataSource;
  final CacheDataSource? cacheDataSource;

  LoginRepositoryImpl(
      {this.remoteDataSource, this.localDataSource, this.cacheDataSource});

  @override
  Future<dynamic> userLogin(User loginData) async {
    // TODO: implement getLogin
    try {
      final uri = Uri.parse(
          AppNetworkConstants.BASE_URL + AppNetworkConstants.LOGIN_URL);

      var loginJson = {
        "email": loginData.email,
        "password": loginData.password
      };
      final dynamic apiResult = await remoteDataSource?.post(loginJson, uri);
      return apiResult;
    } on ServerException {
      return ServerFailure();
    }
  }
}
