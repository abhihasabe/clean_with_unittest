import 'package:clean_unittest/core/constants/app_cache_constant.dart';
import 'package:clean_unittest/feature/app/data/data_sources/app_data_source.dart';
import 'package:clean_unittest/feature/app/domain/repositories/app_repository.dart';
import 'package:clean_unittest/core/manager/cache_manager.dart';

class AppRepositoryImpl implements AppRepository {
  final AppDataSource appDataSource;

  AppRepositoryImpl({required this.appDataSource});

  @override
  Future getLangData(key) {
    // TODO: implement themeData
    return appDataSource.getSelectedLang(key);
  }

  @override
  Future addLangData(key, value) {
    // TODO: implement addThemeData
    return appDataSource.saveSelectedLang(key, value);
  }

  @override
  Future<dynamic> getThemeData(key) {
    // TODO: implement themeData
    return appDataSource.get(key);
  }

  @override
  Future addThemeData(key, value) {
    // TODO: implement addThemeData
    return appDataSource.post(key, value);
  }
}
