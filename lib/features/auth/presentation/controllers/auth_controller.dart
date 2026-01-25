import 'package:darul_rahman_app/core/base/base_controller.dart';
import 'package:darul_rahman_app/core/storage/auth_storage.dart';
import 'package:darul_rahman_app/core/helpers/snackbar_helper.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_request.dart';
import 'package:darul_rahman_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends BaseController {
  final LoginUsecase loginUsecase;

  AuthController(this.loginUsecase);

  Future<void> login(LoginRequest request) async {
    loading.show();
    clearError();

    try {
      final result = await loginUsecase(request);

      await handleResult(result, onSuccess: (data) async {
        await AuthStorage.saveToken(data.token);
        await AuthStorage.saveUser(data.user.toJson());

        Get.toNamed(AppRoutes.home);

        SnackbarHelper.success('Login successful');
      });
    } finally {
      loading.hide();
    }
  }

  Future<void> logout() async {
    loading.show();

    await AuthStorage.clear();
    Get.offAllNamed('/login');
    loading.hide();
  }
}
