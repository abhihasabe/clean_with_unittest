import 'package:clean_unittest/core/error/exceptions.dart';
import 'package:hive/hive.dart';

abstract class LocalDBManager {
  Future<dynamic> request({
    String dbName,
    String method,
    String key,
    String body,
  });
}

class LocalDBManagerImpl implements LocalDBManager {
  late Box _initDB;

  @override
  Future request(
      {String? dbName, String? method, String? key, String? body}) async {
    // TODO: implement r
    _initDB = Hive.box(dbName!);

    try {
      if (method == 'get') {
        return _initDB.get(key);
      } else if (method == 'getAll') {
        return _initDB.toMap().values;
      } else if (method == 'post') {
        return _initDB.add(body);
      } else if (method == 'put') {
        return _initDB.put(key, body);
      } else if (method == 'delete') {
        return _initDB.delete(key);
      } else if (method == 'deleteAll') {
        return _initDB.clear();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}
