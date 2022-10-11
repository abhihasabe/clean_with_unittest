import 'package:clean_unittest/core/constants/app_db_constants.dart';
import 'package:clean_unittest/core/manager/local_db_manager.dart';
import 'package:clean_unittest/feature/language/data/data_sources/lang_data_source.dart';
import 'package:clean_unittest/core/manager/http_client_manager.dart';

class LangDataSourceImpl implements LangDataSource {
  LocalDBManager? localDBManager;

  LangDataSourceImpl({this.localDBManager});

  @override
  Future get(key) async {
    // TODO: implement get
    final localDBResponse = await localDBManager?.request(
        dbName: AppDBConstants.dbName, method: "get", key: key);
    return localDBResponse;
  }

  @override
  Future getAll() async {
    // TODO: implement getAuthData
    final localDBResponse = await localDBManager?.request(
        dbName: AppDBConstants.dbName, method: "getAll");
    return localDBResponse;
  }

  @override
  Future post(key, value) async {
    // TODO: implement post
    final localDBResponse = await localDBManager?.request(
        dbName: AppDBConstants.dbName, method: "put", key: key, body: value);
    return localDBResponse;
  }

  @override
  Future update(key, value) async {
    // TODO: implement update
    final localDBResponse = await localDBManager?.request(
        dbName: AppDBConstants.dbName, method: "put", key: key, body: value);
    return localDBResponse;
  }

  @override
  Future delete(key) async {
    // TODO: implement delete
    final localDBResponse = await localDBManager?.request(
        dbName: AppDBConstants.dbName, method: "delete", key: key);
    return localDBResponse;
  }

  @override
  Future deleteAll() async {
    // TODO: implement deleteAll
    final localDBResponse = await localDBManager?.request(
        dbName: AppDBConstants.dbName, method: "deleteAll");
    return localDBResponse;
  }
}
