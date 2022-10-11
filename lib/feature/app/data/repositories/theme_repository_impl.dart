import 'package:clean_unittest/feature/app/domain/repositories/app_repository.dart';
import 'package:clean_unittest/feature/app/data/data_sources/app_data_source.dart';

class AppRepositoryImpl implements AppRepository {
  final AppDataSource? appDataSource;

  AppRepositoryImpl({this.appDataSource});

  @override
  Future<dynamic> getThemeData(key) {
    // TODO: implement themeData
    return appDataSource!.get(key);
  }

  @override
  Future addThemeData(key, value) {
    // TODO: implement addThemeData
    return appDataSource!.post(key, value);
  }
}
