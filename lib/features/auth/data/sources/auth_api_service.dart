import 'package:darul_rahman_app/core/network/api_response.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_request.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_response.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  final Dio dio;

  AuthApiService(this.dio);

  Future<ApiResponse<LoginResponse>> login(LoginRequest request) async {
    final response = await dio.post(
      '/auth/login',
      data: request.toJson(),
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
  }
}
