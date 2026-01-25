import 'package:darul_rahman_app/core/error/error_mapper.dart';
import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_request.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_response.dart';
import 'package:darul_rahman_app/features/auth/data/repo/auth_repo.dart';
import 'package:darul_rahman_app/features/auth/data/sources/auth_api_service.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthApiService api;

  AuthRepoImpl(this.api);

  @override
  Future<Result<LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await api.login(request);
      return Success(response.data);
    } catch (e) {
      return Failure(ErrorMapper.map(e));
    }
  }
}
