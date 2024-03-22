import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

class CustomLogInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final String data = formatJson(err.response?.data);
    final String baseUrl = err.requestOptions.baseUrl;
    final String path = err.requestOptions.path;
    final String method = err.requestOptions.method.toUpperCase();

    debugPrint('------------------ Error ------------------');
    debugPrint('---URL: $baseUrl$path');
    debugPrint('---Method: $method');
    debugPrint('---Data:  $data');
    debugPrint('---Error:  $err.error');
    debugPrint('--------------------- // ---------------------');

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String method = options.method.toUpperCase();
    final String baseUrl = options.baseUrl;
    final String path = options.path;
    final String queryParams = formatQueryParams(options.queryParameters);
    String body = '';
    if (options.data is FormData) {
      final List<MapEntry<String, String>> fields = options.data.fields;
      body = '---FormData: ${formatFormDataToLog(fields)}';
    } else {
      body = '---Body: ${formatJson(options.data)}';
    }

    debugPrint('------------------ Request Options ------------------');
    debugPrint('---URL: $baseUrl$path');
    debugPrint('---Method: $method');
    debugPrint('---QueryParams:  $queryParams');
    debugPrint('---Headers:  ${options.headers}');
    debugPrint('  $body');
    debugPrint('--------------------- // ---------------------');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final int? stausCode = response.statusCode;
    final String? statusMessage = response.statusMessage;
    final Headers headers = response.headers;
    final dynamic data = formatJson(response.data);
    final String baseUrl = response.requestOptions.baseUrl;
    final String path = response.requestOptions.path;

    debugPrint('------------------ Response Options ------------------');
    debugPrint('---URL: $baseUrl$path');
    debugPrint('---StatusCode: $stausCode');
    debugPrint('---StatusMessage: $statusMessage');
    debugPrint('---Headers:  $headers');
    debugPrint('---Body:  $data');
    debugPrint('--------------------- // ---------------------');
    handler.next(response);
  }

  String formatFormDataToLog(List<MapEntry<String, String>>? formData) {
    String formDataString = '{';

    if (formData != null && formData.isNotEmpty) {
      for (var element in formData) {
        formDataString += '\n"${element.key}": "${element.value}",';
      }
    }

    return formDataString += '\n}';
  }

  String formatQueryParams(Map<String, dynamic>? params) {
    String queryParams = '?';

    if (params != null) {
      params.forEach(
          (key, dynamic value) => queryParams = '$queryParams$key=$value&');
    }

    return queryParams;
  }

  String formatJson(dynamic json) {
    const encoder = JsonEncoder.withIndent(' ');
    return encoder.convert(json);
  }
}
