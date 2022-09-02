import 'package:flutter/material.dart';

abstract class Cache {
  Future<void> save({@required String key, @required String value});
  Future fetch({@required String key});
  Future<void> clear();
}

class CacheManager extends Cache {
  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future fetch({String? key}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> save({String? key, String? value}) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
