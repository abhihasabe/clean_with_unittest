import 'package:clean_unittest/feature/auth/data/data_sources/auth_data_source.dart';
import 'package:clean_unittest/feature/auth/data/models/error_model.dart';
import 'package:clean_unittest/feature/auth/data/models/login_model.dart';
import 'package:clean_unittest/feature/auth/data/models/reg_model.dart';
import 'package:clean_unittest/core/manager/http_client_manager.dart';
import 'package:clean_unittest/core/error/exceptions.dart';

class AuthDataSourceImpl implements AuthDataSource {
  HttpClientManager httpClientManager;

  AuthDataSourceImpl({required this.httpClientManager});

  @override
  Future<LoginModel> login(Map inputData, Uri url) async {
    // TODO: implement post
    try {
      final loginResponse = await httpClientManager.request(
          url: url, method: "post", body: inputData);
      if (loginResponse is ErrorModel) {
        throw ServerException(loginResponse.message);
      } else {
        return LoginModel.fromJson(loginResponse);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<RegModel> register(Map inputData, Uri url) async {
    // TODO: implement update
    try {
      final regResponse = await httpClientManager.request(
          url: url, method: "post", body: inputData);
      if (regResponse is ErrorModel) {
        throw ServerException(regResponse.message);
      } else {
        return RegModel.fromJson(regResponse);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
