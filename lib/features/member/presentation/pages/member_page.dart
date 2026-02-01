import 'package:darul_rahman_app/core/base/base_page.dart';
import 'package:darul_rahman_app/core/helpers/date_time_helper.dart';
import 'package:darul_rahman_app/features/member/domain/entities/member.dart';
import 'package:darul_rahman_app/features/member/presentation/controllers/member_controller.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';
import 'package:darul_rahman_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberPage extends BasePage<MemberController> {
  const MemberPage({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      backgroundColor: AppColors.primary,
      title: const Text('Members'),
      actions: [
        IconButton(
          color: Colors.white,
          onPressed: () {
            controller.getMembers();
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
        Get.offNamed(AppRoutes.memberForm);
      },
      child: const Icon(Icons.add),
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
            if (controller.members.isNotEmpty) ...[
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ],
            const SizedBox(height: 16),
            Expanded(
              child: controller.members.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.folder_off_outlined,
                            size: 100,
                            color: AppColors.primary,
                          ),
                          SizedBox(
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
                      itemCount: controller.members.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _listItem(
                            controller.members[index].name as String, () {
                          _showMerchantDetail(
                              context, controller.members[index]);
                        });
                      }),
            )
          ],
        ),
      );
    });
  }

  Widget _listItem(String title, VoidCallback? onTap) {
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

  void _showMerchantDetail(BuildContext context, Member member) {
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
                      "Detail Member",
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
                        _getText("NIS", member.nis.toString()),
                        const SizedBox(
                          height: 16,
                        ),
                        _getText("Name  ", member.name.toString().capitalize),
                        const SizedBox(
                          height: 16,
                        ),
                        _getText("Tempat Lahir",
                            member.tempatLahir.toString().capitalize),
                        const SizedBox(
                          height: 16,
                        ),
                        _getText("Tanggal Lahir",
                            DateTimeHelper.format(member.tglLahir)),
                        const SizedBox(
                          height: 16,
                        ),
                        _getText("Is Active",
                            member.isActive == true ? "Active" : "Not Active"),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    // await controller
                                    //     .getMerchantById(merchant.id!);
                                    // Get.back();
                                    // Get.toNamed(AppRoutes.fromMerchant);
                                  },
                                  child: const Icon(Icons.edit)),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    // final delete = await DialogHelper.confirm(
                                    //     message:
                                    //         "Are you sure delete this data ??");
                                    // if (delete) {
                                    //   // Get.back();
                                    //   // await controller.remove(merchant.id!);
                                    // }
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
          description?.isNotEmpty == true &&
                  description != 'Null' &&
                  description != null
              ? description
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
