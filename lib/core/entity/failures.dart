abstract class Failure implements Exception {
  Failure({this.message = ''});

  String message;
}

class UnAuthorizedFailure extends Failure {
  UnAuthorizedFailure({super.message = ''});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({super.message = ''});
}

class InvalidParamsFailure extends Failure {
  InvalidParamsFailure({
    super.message = '',
    required this.errors,
  });

  dynamic errors;
}

class ServerErrorFailure extends Failure {
  ServerErrorFailure({super.message = ''});
}

class ParserErrorFailure extends Failure {
  ParserErrorFailure({super.message = ''});
}

class FetchDataErrorFailure extends Failure {
  FetchDataErrorFailure({super.message = ''});
}
