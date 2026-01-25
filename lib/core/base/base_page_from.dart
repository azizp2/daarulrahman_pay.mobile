import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_controller.dart';

abstract class BasePageForm<T extends BaseController> extends GetView<T> {
  const BasePageForm({super.key});

  /// judul di atas (Create Account, Login, dll)
  String get title;

  /// konten form
  Widget buildForm(BuildContext context);

  /// optional
  Widget? buildBottom(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// CARD FORM
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    /// ERROR MESSAGE
                    Obx(() {
                      if (controller.errorMessage.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }),

                    /// FORM CONTENT
                    buildForm(context),
                  ],
                ),
              ),

              if (buildBottom(context) != null) ...[
                const SizedBox(height: 16),
                buildBottom(context)!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
