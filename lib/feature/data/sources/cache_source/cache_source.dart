abstract class CacheDataSource {
  Future<dynamic> getStringData(String key);
  Future<dynamic> saveStringData(String key, String? value);
}
