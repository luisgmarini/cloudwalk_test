import 'package:dio/dio.dart';

import 'handler_response.dart';
import 'http_client.dart';

class HttpClientImpl implements HttpClient {
  HttpClientImpl({
    required this.dioInstance,
  });

  final Dio dioInstance;

  Future<Response<T>> _makeRequest<T>(HttpRequest request) async {
    try {
      final headers = <String, dynamic>{
        Headers.contentTypeHeader: Headers.jsonContentType,
        Headers.acceptHeader: Headers.jsonContentType,
      };

      request.headers == null
          ? request.headers = headers
          : request.headers!.addAll(headers);

      final response = await dioInstance.request<T>(
        request.path,
        options: Options(
          headers: request.headers,
          method: request.method,
          responseType: ResponseType.json,
        ),
        queryParameters: request.queryParams,
        data: request.formData ?? request.data,
      );

      final result = HttpResponseHandler.handle(response);

      return Response(
        requestOptions: RequestOptions(
          path: request.path,
        ),
        data: result,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse<T>> doRequest<T>(HttpRequest request) async {
    final response = await _makeRequest<T>(request);

    return HttpResponse<T>(
      statusCode: response.statusCode,
      data: response.data,
    );
  }
}
