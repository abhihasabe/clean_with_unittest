import 'package:clean_unittest/core/manager/local_db_manager.dart';
import 'package:clean_unittest/feature/data/sources/local_source/local_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  LocalDB? localDB;

  LocalDataSourceImpl({this.localDB});

  @override
  Future getLocalAuthData() {
    // TODO: implement getAuthData
    throw UnimplementedError();
  }
}
