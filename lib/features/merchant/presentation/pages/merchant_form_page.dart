import 'package:darul_rahman_app/core/base/base_page.dart';
import 'package:darul_rahman_app/core/utils/validator_utils.dart';
import 'package:darul_rahman_app/widgets/forms/input_text_with_title.dart';
import 'package:darul_rahman_app/features/merchant/presentation/controllers/merchant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MerchantFormPage extends BasePage<MerchantController> {
  MerchantFormPage({super.key});
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
            controller.getMerchants();
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
                    label: 'Merchant Name',
                    controller: controller.nameCtrl,
                    hintText: 'Please insert merchant name',
                    keyboardType: TextInputType.text,
                    onChanged: (value) => controller.nameCtrl.text = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Merchant name wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  InputTextWithTitle(
                    label: 'Email',
                    controller: controller.emailCtrl,
                    hintText: 'Please insert email',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => controller.emailCtrl.text = value,
                    validator: (value) {
                      if (!Validators.isValidEmail(value)) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  InputTextWithTitle(
                    label: 'Phone Number',
                    controller: controller.phoneCtrl,
                    hintText: 'Phone number format 08xxxxxxxxxx',
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => controller.phoneCtrl.text = value,
                    validator: (value) {
                      if (!Validators.isValidPhone(value)) {
                        return 'Phone number format tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  InputTextWithTitle(
                    label: 'Address',
                    controller: controller.addressCtrl,
                    hintText: 'Please insert address',
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) => controller.addressCtrl.text = value,
                    minLines: 3,
                    maxLines: null,
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(() => Checkbox(
                        value: controller.isActive.value,
                        onChanged: (value) {
                          controller.isActive.value = value ?? false;
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
