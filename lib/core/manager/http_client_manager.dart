import 'package:clean_unittest/core/error/exceptions.dart';
import 'package:meta/meta.dart' show required;
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class HttpClientManager {
  Future<dynamic> request({
    @required Uri url,
    @required String method,
    Map body,
    Map headers,
  });
}

class HttpClientManagerImpl implements HttpClientManager {
  final http.Client initClient;

  HttpClientManagerImpl({required this.initClient});

  Future<dynamic> request(
      {@required Uri? url,
      @required String? method,
      Map? body,
      Map? headers}) async {
    final defaultHeaders = /*headers?.cast<String, String>() ?? {}
      ..addAll(
          */
        {'content-type': 'application/json', 'accept': 'application/json'};
    /*);*/
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = http.Response('', 500);
    Future<http.Response>? futureResponse;
    try {
      if (method == 'post') {
        futureResponse =
            initClient.post(url!, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'get') {
        futureResponse = initClient.get(url!, headers: defaultHeaders);
      } else if (method == 'put') {
        futureResponse =
            initClient.put(url!, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'delete') {
        futureResponse = initClient.delete(url!, headers: defaultHeaders);
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 30));
      }
    } catch (error) {
      throw ServerException();
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorizedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 409:
        throw ConflictException(response.body.toString());
      case 500:
        throw InternalServerErrorException(response.body.toString());
      case 503:
        throw ServiceUnavailableException(response.body.toString());
      default:
        throw ServerException();
    }
  }
}
