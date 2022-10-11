abstract class SplashDataSource {
  Future<dynamic> getStringData(String key);
  Future<dynamic> saveStringData(String key, String? value);
}
