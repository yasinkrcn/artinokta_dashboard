import 'package:tv_artinokta/core/const/app_environment.dart';
import 'package:dio/dio.dart';

class DioManager {
  static Dio restApi() {
    Dio dio = Dio();

    dio.options.baseUrl = AppEnvironment.baseUrl;

    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    dio.options.validateStatus = (status) => status! < 500 && status != 401;

    dio.options.responseType = ResponseType.plain;

    // dio.interceptors.add(RefreshTokenInterceptor(dio));

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ));
    return dio;
  }
}
