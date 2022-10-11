import 'package:clean_unittest/feature/language/domain/repositories/lang_repository.dart';
import 'package:clean_unittest/feature/language/data/data_sources/lang_data_source.dart';

class LangRepositoryImpl implements LangRepository {
  final LangDataSource? langDataSource;

  LangRepositoryImpl({this.langDataSource});

  @override
  Future<dynamic> getThemeData(key) {
    // TODO: implement themeData
    return langDataSource!.get(key);
  }

  @override
  Future addThemeData(key, value) {
    // TODO: implement addThemeData
    return langDataSource!.post(key, value);
  }
}
