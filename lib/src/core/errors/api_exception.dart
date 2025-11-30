class ApiException implements Exception {
  final String message;
  final int? code;

  ApiException(this.message, {this.code});
}

class BadRequestException extends ApiException {
  BadRequestException(super.message) : super(code: 400);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message) : super(code: 401);
}

class NotFoundException extends ApiException {
  NotFoundException(super.message) : super(code: 404);
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(super.message) : super(code: 500);
}

class UnknownException extends ApiException {
  UnknownException(super.message);
}

ApiException handleDioError(dynamic error) {
  final response = error.response;
  switch (response?.statusCode) {
    case 400:
      return BadRequestException(response?.data.toString() ?? 'Bad Request');
    case 401:
      return UnauthorizedException(response?.data.toString() ?? 'Unauthorized');
    case 404:
      return NotFoundException(response?.data.toString() ?? 'Not Found');
    case 500:
      return InternalServerErrorException(
        response?.data.toString() ?? 'Server Error',
      );
    default:
      return UnknownException(error.message ?? 'Unknown error');
  }
}
