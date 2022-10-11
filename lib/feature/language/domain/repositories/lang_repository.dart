abstract class LangRepository {
  Future<dynamic> getThemeData(String key);

  Future<dynamic> addThemeData(String key, String value);
}
