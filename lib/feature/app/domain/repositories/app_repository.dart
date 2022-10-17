
abstract class AppRepository {
  Future<dynamic> getLangData(String key);
  Future<dynamic> addLangData(String key, String value);
  Future<dynamic> getThemeData(String key);
  Future<dynamic> addThemeData(String key, String value);
}