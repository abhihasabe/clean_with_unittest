import 'package:clean_unittest/feature/app/data/data_sources/app_data_source.dart';
import 'package:clean_unittest/core/constants/app_cache_constant.dart';
import 'package:clean_unittest/core/manager/cache_manager.dart';

class AppDataSourceImpl implements AppDataSource {
  CacheManager cacheManager;

  AppDataSourceImpl({required this.cacheManager});

  @override
  Future getSelectedLang(key) async {
    // TODO: implement get
    final localDBResponse = await cacheManager.request(
        cacheName: CacheConstants.cacheName, method: 'getString', key: key);
    return localDBResponse;
  }

  @override
  Future saveSelectedLang(key, value) async {
    // TODO: implement post
    final localDBResponse = await cacheManager.request(
        cacheName: CacheConstants.cacheName,
        method: 'postString',
        key: key,
        value: value);
    return localDBResponse;
  }

  @override
  Future get(key) async {
    // TODO: implement get
    final localDBResponse = await cacheManager.request(
        cacheName: CacheConstants.cacheName, method: "getString", key: key);
    return localDBResponse;
  }

  @override
  Future post(key, value) async {
    // TODO: implement post
    final localDBResponse = await cacheManager.request(
        cacheName: CacheConstants.cacheName,
        method: "postString",
        key: key,
        value: value);
    return localDBResponse;
  }
}
