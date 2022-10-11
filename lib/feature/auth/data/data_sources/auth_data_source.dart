import 'package:clean_unittest/feature/auth/data/models/login_model.dart';
import 'package:clean_unittest/feature/auth/data/models/reg_model.dart';

abstract class AuthDataSource {
  Future<LoginModel> login(Map inputData, Uri baseURL);

  Future<RegModel> register(Map inputData, Uri baseURL);
}
