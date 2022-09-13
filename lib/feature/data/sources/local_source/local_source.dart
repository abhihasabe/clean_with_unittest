abstract class LocalDataSource {
  Future<dynamic> get(String key);

  Future<dynamic> getAll();

  Future<dynamic> post(String key, String value);

  Future<dynamic> update(String key, String value);

  Future<dynamic> delete(String key);

  Future<dynamic> deleteAll();
}
