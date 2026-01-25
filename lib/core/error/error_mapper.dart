import 'package:darul_rahman_app/core/error/error_response.dart';
import 'package:dio/dio.dart';

class AppError {
  final String message;
  final Map<String, List<String>>? validationErrors;

  AppError({
    required this.message,
    this.validationErrors,
  });

  bool get hasValidation => validationErrors != null;
}

class ErrorMapper {
  static AppError map(dynamic error) {
    if (error is DioException) {
      final response = error.response;

      if (response?.data is Map<String, dynamic>) {
        final err = ErrorResponse.fromJson(response!.data);
        return AppError(
          message: err.message,
          validationErrors: err.errors,
        );
      }

      return AppError(
        message: error.message ?? 'Network error',
      );
    }

    return AppError(message: 'Unexpected error');
  }
}
