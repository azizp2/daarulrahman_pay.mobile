import 'package:darul_rahman_app/core/base/base_controller.dart';
import 'package:darul_rahman_app/core/helpers/date_time_helper.dart';
import 'package:darul_rahman_app/core/helpers/snackbar_helper.dart';
import 'package:darul_rahman_app/features/member/domain/entities/member.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/add_member_usecase.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/get_member_usecase.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/params/member_request_param.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberController extends BaseController {
  final GetMemberUsecase getMemberUsecase;
  final AddMemberUsecase addMemberUsecase;

  final members = <Member>[].obs;

  MemberController(this.getMemberUsecase, this.addMemberUsecase);

  final nisCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final tempatLahorCtrl = TextEditingController();
  final tglLahirCtrl = TextEditingController();
  final isActiveCtrl = true.obs;

  final selectedDate = Rx<DateTime?>(null);

  @override
  void onReady() {
    super.onReady();
    getMembers();
  }

  Future<void> getMembers() async {
    loading.show();
    try {
      final result = await getMemberUsecase();
      await handleResult(result, onSuccess: (data) async {
        members.assignAll(data);
      });
    } finally {
      loading.hide();
    }
  }

  Future<void> submit() async {
    loading.show();
    try {
      final data = MemberRequestParam(
          nis: nisCtrl.text.trim(),
          name: nameCtrl.text.capitalize,
          tempatLahir: tempatLahorCtrl.text.capitalize,
          tglLahir: DateTimeHelper.parse(tglLahirCtrl.text),
          isActive: isActiveCtrl.value);
      final result = await addMemberUsecase(data);
      await handleResult(result, onSuccess: (_) async {
        await getMembers();
        SnackbarHelper.success("Create member successfully");
        Get.offNamed(AppRoutes.member);
        resetForm();
      });
    } finally {
      loading.hide();
    }
  }

  void resetForm() {
    errorMessage.value = '';
    nisCtrl.clear();
    nameCtrl.clear();
    tempatLahorCtrl.clear();
    tglLahirCtrl.clear();
    isActiveCtrl.value = true;
  }
}
