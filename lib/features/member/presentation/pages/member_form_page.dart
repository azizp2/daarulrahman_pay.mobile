import 'package:darul_rahman_app/core/base/base_page.dart';
import 'package:darul_rahman_app/features/member/presentation/controllers/member_controller.dart';
import 'package:darul_rahman_app/widgets/forms/input_date_with_title.dart';
import 'package:darul_rahman_app/widgets/forms/input_text_with_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MemberFormPage extends BasePage<MemberController> {
  MemberFormPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text('Form Merchant'),
      actions: [
        IconButton(
          onPressed: () {
            controller.getMembers();
          },
          color: Colors.white,
          icon: const Icon(
            Icons.save_outlined,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  InputTextWithTitle(
                    label: 'Nis',
                    controller: controller.nisCtrl,
                    hintText: 'Please input nis',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => controller.nisCtrl.text = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nis wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  InputTextWithTitle(
                    label: 'Fullname',
                    controller: controller.nameCtrl,
                    hintText: 'Please insert fullname',
                    keyboardType: TextInputType.text,
                    onChanged: (value) => controller.nameCtrl.text = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Fullname wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  InputTextWithTitle(
                    label: 'Tempat Lahir',
                    controller: controller.tempatLahorCtrl,
                    hintText: 'Please tempat lahir',
                    keyboardType: TextInputType.text,
                    onChanged: (value) =>
                        controller.tempatLahorCtrl.text = value,
                  ),
                  const SizedBox(height: 16),
                  InputDateWithTitle(
                    label: "Tanggal Lahir",
                    controller: controller.tglLahirCtrl,
                    hintText: "Pilih tanggal",
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(() => Checkbox(
                        value: controller.isActiveCtrl.value,
                        onChanged: (value) {
                          controller.isActiveCtrl.value = value ?? false;
                        },
                      )),
                  const Expanded(
                    child: Text(
                      'Is Active',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  controller.submit();
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
