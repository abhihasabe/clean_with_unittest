class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Server Exception: ");
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message])
      : super(message, "Forbidden Exception: ");
}

class ConflictException extends AppException {
  ConflictException([String? message]) : super(message, "Conflict Exception: ");
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message])
      : super(message, "Internal Server Error Exception: ");
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String? message])
      : super(message, "Service Unavailable Exception: ");
}

class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message, "Not Found Exception: ");
}

class NotConnectedException extends AppException {
  NotConnectedException([String? message])
      : super(message, "Internet Connection Exception: ");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, "UnAuthorized: ");
}

class CacheException extends AppException {
  CacheException([String? message]) : super(message, "Cache Exception: ");
}

class ItemNotFoundException extends AppException {
  ItemNotFoundException([String? message]) : super(message, "Item Not Found: ");
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
