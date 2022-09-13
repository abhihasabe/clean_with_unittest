abstract class RemoteDataSource {
  Future<dynamic> get(Uri baseURL);

  Future<dynamic> post(Map inputData, Uri baseURL);

  Future<dynamic> update(Map inputData, Uri baseURL);

  Future<dynamic> delete(Uri baseURL);
}
