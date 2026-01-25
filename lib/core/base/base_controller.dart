import 'package:darul_rahman_app/core/error/error_mapper.dart';
import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/core/helpers/snackbar_helper.dart';
import 'package:get/get.dart';
import '../../widgets/loading/loading_controller.dart';

abstract class BaseController extends GetxController {
  late final LoadingController loading;

  final errorMessage = ''.obs;
  final validationErrors = <String, List<String>>{}.obs;

  @override
  void onInit() {
    loading = Get.find<LoadingController>();
    super.onInit();
  }

  void clearError() {
    errorMessage.value = '';
    validationErrors.clear();
  }

  void handleError(AppError error) {
    errorMessage.value = error.message;

    if (error.hasValidation) {
      validationErrors.assignAll(error.validationErrors!);
    } else {
      SnackbarHelper.error(error.message);
    }
  }

  Future<void> handleResult<T>(
    Result<T> result, {
    required Future<void> Function(T data) onSuccess,
  }) async {
    switch (result) {
      case Success():
        await onSuccess(result.data);
        break;

      case Failure():
        handleError(result.error);
        break;
    }
  }
}
