import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<HttpResponse<T>> doRequest<T>(HttpRequest request);
}

class HttpRequest {
  HttpRequest({
    required this.path,
    required this.method,
    this.formData,
    this.mockFile,
    this.data,
    this.headers,
    this.params,
    this.queryParams,
  });

  dynamic data;
  FormData? formData;
  Map<String, dynamic>? headers;
  Map<String, dynamic>? params;
  Map<String, dynamic>? queryParams;
  String method;
  String path;
  String? mockFile;
}

class HttpResponse<T> {
  HttpResponse({
    required this.statusCode,
    this.message,
    this.data,
  });

  final int? statusCode;
  final String? message;
  final T? data;

  HttpResponse copyWith({
    int? statusCode,
    String? message,
    T? data,
  }) {
    return HttpResponse<T>(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
