import 'package:shared_preferences/shared_preferences.dart';
import 'package:clean_unittest/core/error/exceptions.dart';

abstract class CacheManager {
  Future<dynamic> request({
    String cacheName,
    String method,
    String key,
    String value,
  });
}

class CacheManagerImpl extends CacheManager {
  SharedPreferences? initSharedPref;

  CacheManagerImpl({this.initSharedPref});

  @override
  Future request(
      {String? cacheName, String? method, String? key, String? value}) async {
    // TODO: implement request
    try {
      if (method == 'get') {
        return initSharedPref?.get(key!);
      } else if (method == 'getString') {
        return initSharedPref?.getString(key!);
      } else if (method == 'getInt') {
        return initSharedPref?.getInt(key!);
      } else if (method == 'getDouble') {
        return initSharedPref?.getDouble(key!);
      } else if (method == 'getBool') {
        return initSharedPref?.getBool(key!);
      } else if (method == 'postString') {
        return initSharedPref?.setString(key!, value.toString());
      } else if (method == 'postInt') {
        return initSharedPref?.setInt(key!, int.parse(value!));
      } else if (method == 'postDouble') {
        return initSharedPref?.setDouble(key!, double.parse(value!));
      } else if (method == 'postBool') {
        return initSharedPref?.setBool(
            key!, bool.fromEnvironment(value!, defaultValue: true));
      } else if (method == 'delete') {
        return initSharedPref?.remove(key!);
      } else if (method == 'deleteAll') {
        return initSharedPref?.clear();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}
