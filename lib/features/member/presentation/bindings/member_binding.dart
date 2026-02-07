import 'package:darul_rahman_app/features/member/presentation/controllers/member_controller.dart';
import 'package:get/get.dart';

class MemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberController>(
        () => MemberController(
            Get.find(), Get.find(), Get.find(), Get.find(), Get.find()),
        fenix: true);
  }
}
