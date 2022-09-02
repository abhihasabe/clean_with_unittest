import 'package:clean_unittest/feature/data/sources/cache_source/cache_source.dart';
import 'package:clean_unittest/core/manager/cache_manager.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/either.dart';

class CacheDataSourceImpl implements CacheDataSource {
  Cache? cache;

  CacheDataSourceImpl({this.cache});

  @override
  Future<Either<Failure, dynamic>> getCacheAuthData() async {
    // TODO: implement getAuthData
    return await cache?.fetch(key: "user");
  }
}
