abstract class HttpException implements Exception {
  HttpException({
    required this.error,
  });
  final dynamic error;
}

class UnauthorizedException extends HttpException {
  UnauthorizedException({
    required super.error,
  });
}

class ForbiddenException extends HttpException {
  ForbiddenException({
    required super.error,
  });
}

class NotFoundException extends HttpException {
  NotFoundException({
    required super.error,
  });
}

class BadRequestException extends HttpException {
  BadRequestException({
    required super.error,
  });
}

class UnprocessableException extends HttpException {
  UnprocessableException({
    required super.error,
  });
}

class ServerErrorException extends HttpException {
  ServerErrorException({
    required super.error,
  });
}
