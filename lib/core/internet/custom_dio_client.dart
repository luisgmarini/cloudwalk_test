import 'package:cloudwalk_weather_test/core/constants/api/api_const.dart';
import 'package:dio/dio.dart';

import 'interceptor/custom_log_intercptor.dart';
import 'interceptor/token_request_interceptor.dart';

class CustomDioClient {
  CustomDioClient._();

  static Dio initialize() {
    return Dio()
      ..options.connectTimeout = const Duration(seconds: 25)
      ..options.receiveTimeout = const Duration(seconds: 25)
      ..options.contentType = Headers.jsonContentType
      ..options.baseUrl = APIConst.weatherBaseUrl
      ..interceptors.addAll(
        [
          TokenRequestInterceptor(),
          CustomLogInterceptor(),
        ],
      );
  }
}
