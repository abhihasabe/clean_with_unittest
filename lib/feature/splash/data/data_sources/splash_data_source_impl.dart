import 'package:clean_unittest/feature/splash/data/data_sources/splash_data_source.dart';
import 'package:clean_unittest/core/constants/app_cache_constant.dart';
import 'package:clean_unittest/core/manager/cache_manager.dart';

class SplashDataSourceImpl implements SplashDataSource {
  CacheManager? cache;

  SplashDataSourceImpl({this.cache});

  @override
  Future<dynamic> getStringData(String key) async {
    // TODO: implement getAuthData
    final cacheResponse = await cache?.request(
        cacheName: CacheConstants.cacheName, method: "getString", key: key);
    return cacheResponse;
  }

  @override
  Future saveStringData(String key, String? value) async {
    // TODO: implement save

    final httpResponse = await cache?.request(
        cacheName: CacheConstants.cacheName,
        method: "postString",
        key: key,
        value: value!);
    return httpResponse;
  }
}
