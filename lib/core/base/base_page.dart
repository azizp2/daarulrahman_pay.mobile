import 'package:darul_rahman_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_controller.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {
  const BasePage({super.key});

  /// WAJIB: isi konten utama page
  Widget buildContent(BuildContext context);

  /// Optional: override kalau perlu
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget? buildFloatingActionButton(BuildContext context) => null;

  /// Optional: override kalau tidak mau padding default
  EdgeInsetsGeometry get padding => const EdgeInsets.all(12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      floatingActionButton: buildFloatingActionButton(context),
      body: SafeArea(
        child: Column(
          children: [
            /// ERROR MESSAGE GLOBAL
            Obx(() {
              if (controller.errorMessage.isEmpty) return const SizedBox();

              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                    left: BorderSide(color: AppColors.danger, width: 4),
                  ),
                ),
                child: Text(
                  controller.errorMessage.value,
                  style: const TextStyle(
                    color: AppColors.danger,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }),

            /// CONTENT
            Expanded(
              child: buildContent(context),
            )
          ],
        ),
      ),
    );
  }
}
