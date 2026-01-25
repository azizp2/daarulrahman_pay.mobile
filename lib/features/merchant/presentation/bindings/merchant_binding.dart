import 'package:darul_rahman_app/features/merchant/presentation/controllers/merchant_controller.dart';
import 'package:get/get.dart';

class MerchantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantController>(
        () => MerchantController(
            Get.find(), Get.find(), Get.find(), Get.find(), Get.find()),
        fenix: true);
  }
}
