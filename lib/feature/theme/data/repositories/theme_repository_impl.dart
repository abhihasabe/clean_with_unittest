import 'package:clean_unittest/feature/theme/data/data_sources/theme_data_source.dart';
import 'package:clean_unittest/feature/theme/domain/repositories/app_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource? themeDataSource;

  ThemeRepositoryImpl({this.themeDataSource});

  @override
  Future<dynamic> getThemeData(key) {
    // TODO: implement themeData
    return themeDataSource!.get(key);
  }

  @override
  Future addThemeData(key, value) {
    // TODO: implement addThemeData
    return themeDataSource!.post(key, value);
  }
}
