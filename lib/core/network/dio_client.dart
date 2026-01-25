import 'package:darul_rahman_app/core/network/interceptors/auth_interceptor.dart';
import 'package:darul_rahman_app/core/network/interceptors/error_interceptor.dart';
import 'package:darul_rahman_app/core/network/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:darul_rahman_app/core/constant/api_constant.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: ApiConstant.connectTimeout,
        receiveTimeout: ApiConstant.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);

    return dio;
  }
}
