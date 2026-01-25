import 'package:darul_rahman_app/core/base/base_controller.dart';
import 'package:darul_rahman_app/core/helpers/snackbar_helper.dart';
import 'package:darul_rahman_app/features/merchant/domain/entities/merchant.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/add_merchant_usecase.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/get_by_id_merchant_usecase.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/get_merchant_usecase.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/params/merchant_request_param.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/remove_merchant_usercase.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/update_merchant_usecase.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantController extends BaseController {
  final GetMerchantUsecase getMerchantUsecase;
  final AddMerchantUsecase addMerchantUsecase;
  final GetByIdMerchantUsecase getByIdMerchantUsecase;
  final UpdateMerchantUseCase updateMerchantUseCase;
  final RemoveMerchantUsercase removeMerchantUsercase;

  MerchantController(
      this.getMerchantUsecase,
      this.addMerchantUsecase,
      this.getByIdMerchantUsecase,
      this.updateMerchantUseCase,
      this.removeMerchantUsercase);
  final merchants = <Merchant>[].obs;

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final isActive = true.obs;

  int? merchantId;

  @override
  void onReady() {
    super.onReady();
    getMerchants();
  }

  Future<void> getMerchants() async {
    loading.show();
    try {
      final result = await getMerchantUsecase();

      await handleResult(result, onSuccess: (data) async {
        merchants.assignAll(data);
      });
    } finally {
      loading.hide();
    }
  }

  Future<void> getMerchantById(int id) async {
    loading.show();
    try {
      final result = await getByIdMerchantUsecase(id);

      await handleResult(result, onSuccess: (data) async {
        merchantId = data.id;
        nameCtrl.text = data.name ?? '';
        emailCtrl.text = data.email ?? '';
        phoneCtrl.text = data.phone ?? '';
        addressCtrl.text = data.address ?? '';
        isActive.value = data.isActive ?? true;
      });
    } finally {
      loading.hide();
    }
  }

  Future<void> submit() async {
    loading.show();
    try {
      final data = MerchantRequestParam(
        name: nameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        phone: phoneCtrl.text.trim(),
        address: addressCtrl.text,
        isActive: isActive.value,
      );

      final result = merchantId == null
          ? await addMerchantUsecase(data)
          : await updateMerchantUseCase(merchantId!, data);

      await handleResult(result, onSuccess: (_) async {
        await getMerchants();
        SnackbarHelper.success(
            "${merchantId != null ? "Update" : "Create"} merchant berhasil ditambahkan");
        Get.offNamed(AppRoutes.merchant);
        resetForm();
      });
    } finally {
      loading.hide();
    }
  }

  Future<void> remove(int id) async {
    loading.show();
    try {
      final result = await removeMerchantUsercase(id);

      await handleResult(result, onSuccess: (_) async {
        await getMerchants();
        SnackbarHelper.success("Delete merchant successfully.");
        Get.offNamed(AppRoutes.merchant);
      });
    } finally {
      loading.hide();
    }
  }

  void resetForm() {
    merchantId = null;
    nameCtrl.clear();
    emailCtrl.clear();
    phoneCtrl.clear();
    addressCtrl.clear();
    isActive.value = true;
  }
}
