import 'package:dio/dio.dart';

class TokenRequestInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions requestOptions,
      RequestInterceptorHandler requestInterceptor) async {
    return requestInterceptor.next(requestOptions);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
