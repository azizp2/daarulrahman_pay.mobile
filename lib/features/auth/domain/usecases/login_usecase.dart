import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_request.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_response.dart';
import 'package:darul_rahman_app/features/auth/data/repo/auth_repo.dart';

class LoginUsecase {
  final AuthRepo repository;

  LoginUsecase(this.repository);

  Future<Result<LoginResponse>> call(LoginRequest request) {
    return repository.login(request);
  }
}
