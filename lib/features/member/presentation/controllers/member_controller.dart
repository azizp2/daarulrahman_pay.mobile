import 'package:darul_rahman_app/core/base/base_controller.dart';
import 'package:darul_rahman_app/core/helpers/date_time_helper.dart';
import 'package:darul_rahman_app/core/helpers/snackbar_helper.dart';
import 'package:darul_rahman_app/features/member/domain/entities/member.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/add_member_usecase.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/get_by_id_member_usecase.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/get_member_usecase.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/params/member_request_param.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/remove_member_usecase.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/update_member_usecase.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberController extends BaseController {
  final AddMemberUsecase addMemberUsecase;
  final GetByIdMemberUsecase getByIdMemberUsecase;
  final GetMemberUsecase getMemberUsecase;
  final UpdateMemberUsecase updateMemberUsecase;
  final RemoveMemberUsecase removeMemberUsecase;

  final members = <Member>[].obs;

  MemberController(
      this.getMemberUsecase,
      this.addMemberUsecase,
      this.getByIdMemberUsecase,
      this.updateMemberUsecase,
      this.removeMemberUsecase);

  final nisCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final tempatLahorCtrl = TextEditingController();
  final tglLahirCtrl = TextEditingController();
  final isActiveCtrl = true.obs;

  int? memberId;

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

  Future<void> getbyId(int id) async {
    loading.show();
    try {
      final result = await getByIdMemberUsecase(id);

      await handleResult(result, onSuccess: (data) async {
        nisCtrl.text = data.nis.toString();
        nameCtrl.text = data.name;
        tempatLahorCtrl.text = data.tempatLahir ?? '';
        tglLahirCtrl.text =
            data.tglLahir != null ? DateTimeHelper.format(data.tglLahir) : '';
        isActiveCtrl.value = data.isActive;
        memberId = data.id;
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
      final result = memberId == null
          ? await addMemberUsecase(data)
          : await updateMemberUsecase(memberId!, data);
      await handleResult(result, onSuccess: (_) async {
        await getMembers();
        SnackbarHelper.success(
            "${memberId == null ? 'Create' : 'Update'} member successfully");
        Get.until((route) => route.settings.name == AppRoutes.member);
        resetForm();
      });
    } finally {
      loading.hide();
    }
  }

  Future<void> remove(int id) async {
    loading.show();
    try {
      final result = await removeMemberUsecase(id);
      await handleResult(result, onSuccess: (_) async {
        await getMembers();
        SnackbarHelper.success("Delete member succesfully.");
        Get.offNamed(AppRoutes.member);
      });
    } finally {
      loading.hide();
    }
  }

  void resetForm() {
    errorMessage.value = '';
    memberId = null;
    nisCtrl.clear();
    nameCtrl.clear();
    tempatLahorCtrl.clear();
    tglLahirCtrl.clear();
    isActiveCtrl.value = true;
  }
}
