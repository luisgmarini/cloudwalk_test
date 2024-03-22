import 'package:dio/dio.dart';

import 'exceptions/http_exception.dart';

class HttpResponseHandler {
  static dynamic handle(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 204:
        return null;
      case 400:
        throw BadRequestException(error: response.data);
      case 401:
        throw UnauthorizedException(error: response.data);
      case 403:
        throw ForbiddenException(error: response.data);
      case 404:
        throw NotFoundException(error: response.data);

      case 422:
        throw UnprocessableException(error: response.data);

      default:
        throw ServerErrorException(
          error: response.data,
        );
    }
  }
}
