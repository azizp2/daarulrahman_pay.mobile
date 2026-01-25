import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static Future<bool> confirm({
    String title = 'Konfirmasi',
    required String message,
    String confirmText = 'Ya',
    String cancelText = 'Batal',
    Color? confirmColor,
    IconData? icon,
    bool barrierDismissible = false,
  }) async {
    return await Get.dialog<bool>(
          AlertDialog(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: confirmColor ?? Get.theme.colorScheme.primary,
                  ),
                if (icon != null) const SizedBox(width: 8),
                Expanded(child: Text(title)),
              ],
            ),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: Text(cancelText),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor:
                      confirmColor ?? Get.theme.colorScheme.primary,
                ),
                onPressed: () => Get.back(result: true),
                child: Text(confirmText),
              ),
            ],
          ),
          barrierDismissible: barrierDismissible,
        ) ??
        false;
  }
}
