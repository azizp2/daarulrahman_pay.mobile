import 'package:darul_rahman_app/core/base/base_page.dart';
import 'package:darul_rahman_app/core/helpers/dialog_helper.dart';
import 'package:darul_rahman_app/theme/app_colors.dart';
import 'package:darul_rahman_app/features/merchant/domain/entities/merchant.dart';
import 'package:darul_rahman_app/features/merchant/presentation/controllers/merchant_controller.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantPage extends BasePage<MerchantController> {
  const MerchantPage({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      backgroundColor: AppColors.primary,
      title: const Text('Merchant Page'),
      actions: [
        IconButton(
          color: Colors.white,
          onPressed: () async {
            await controller.getMerchants();
          },
          icon: const Icon(
            Icons.restart_alt_outlined,
          ),
        ),
      ],
    );
  }

  @override
  Widget? buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () {
        controller.resetForm();
        Get.toNamed(AppRoutes.fromMerchant);
      },
      child: Icon(Icons.add),
      foregroundColor: Colors.white,
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            if (controller.merchants.isNotEmpty) ...[
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ],
            const SizedBox(height: 16),
            Expanded(
              child: controller.merchants.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.folder_off_outlined,
                            size: 100,
                            color: AppColors.primary,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Data Not Found",
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.merchants.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _merchantItem(
                            controller.merchants[index].name as String, () {
                          _showMerchantDetail(
                              context, controller.merchants[index]);
                        });
                      }),
            )
          ],
        ),
      );
    });
  }

  Widget _merchantItem(String title, VoidCallback? onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.ad_units, color: Colors.blue),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  void _showMerchantDetail(BuildContext context, Merchant merchant) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(
                    child: Text(
                      "Detail Merchant",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getText("Merchant Name",
                            merchant.name.toString().capitalize),
                        const SizedBox(
                          height: 16,
                        ),
                        _getText("Email", merchant.email.toString()),
                        const SizedBox(
                          height: 16,
                        ),
                        _getText("Phone Number", merchant.phone.toString()),
                        const SizedBox(
                          height: 16,
                        ),
                        _getText("Address", merchant.address.toString()),
                        const SizedBox(
                          height: 16,
                        ),
                        _getText(
                            "Is Active",
                            merchant.isActive == true
                                ? "Active"
                                : "Not Active"),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await controller
                                        .getMerchantById(merchant.id!);
                                    Get.back();
                                    Get.toNamed(AppRoutes.fromMerchant);
                                  },
                                  child: const Icon(Icons.edit)),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final delete = await DialogHelper.confirm(
                                        message:
                                            "Are you sure delete this data ??");
                                    if (delete) {
                                      Get.back();
                                      await controller.remove(merchant.id!);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.danger),
                                  child: const Icon(Icons.delete)),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _getText(String title, String? description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          description?.isNotEmpty == true && description != 'null'
              ? description!
              : '',
          style: const TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
