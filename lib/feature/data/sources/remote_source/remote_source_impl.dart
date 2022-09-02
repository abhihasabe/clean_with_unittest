import 'package:clean_unittest/core/manager/http_client_manager.dart';
import 'package:clean_unittest/feature/data/sources/remote_source/remote_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  HttpClientManager httpClientManager;

  RemoteDataSourceImpl({required this.httpClientManager});

  @override
  Future getAuthData() async {
    return await httpClientManager.request(url: "url", method: "put");
  }
}
