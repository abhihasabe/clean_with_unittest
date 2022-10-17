abstract class AppDataSource {
  Future<dynamic> getSelectedLang(String key);

  Future<dynamic> saveSelectedLang(String key, String value);

  Future<dynamic> get(String key);

  Future<dynamic> post(String key, String value);
}
