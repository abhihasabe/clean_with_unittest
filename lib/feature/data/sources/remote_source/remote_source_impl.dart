import 'package:clean_unittest/feature/data/sources/remote_source/remote_source.dart';
import 'package:clean_unittest/core/manager/http_client_manager.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  HttpClientManager httpClientManager;

  RemoteDataSourceImpl({required this.httpClientManager});

  @override
  Future get(Uri url) async {
    final httpResponse =
        await httpClientManager.request(url: url, method: "get");
    return httpResponse;
  }

  @override
  Future post(Map inputData, Uri url) async {
    // TODO: implement post
    final httpResponse = await httpClientManager.request(
        url: url, method: "post", body: inputData);
    return httpResponse;
  }

  @override
  Future update(Map inputData, Uri url) async {
    // TODO: implement update
    final httpResponse = await httpClientManager.request(
        url: url, method: "put", body: inputData);
    return httpResponse;
  }

  @override
  Future delete(Uri url) async {
    // TODO: implement delete
    final httpResponse =
        await httpClientManager.request(url: url, method: "delete");
    return httpResponse;
  }
}
