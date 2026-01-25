import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_request.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_response.dart';

abstract class AuthRepo {
  AuthRepo(find);

  Future<Result<LoginResponse>> login(LoginRequest request);
}
