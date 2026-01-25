import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void _show({
    required Color color,
    required IconData icon,
    required String title,
    required String message,
    Duration? duration,
    bool showClose = false,
  }) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.zero,
      duration: duration,
      isDismissible: true,
      messageText: _SnackbarCard(
        color: color,
        icon: icon,
        title: title,
        message: message,
        showClose: showClose,
      ),
    );
  }

  /// ❌ ERROR — persistent
  static void error(String message) {
    _show(
      color: Colors.red.shade600,
      icon: Icons.error_outline,
      title: 'Error',
      message: message,
      duration: const Duration(seconds: 2), // ❗ persistent
      showClose: true,
    );
  }

  /// 🟢 SUCCESS — auto close
  static void success(String message) {
    _show(
      color: Colors.green.shade600,
      icon: Icons.check_circle_outline,
      title: 'Success',
      message: message,
      duration: const Duration(seconds: 2),
    );
  }
}

class _SnackbarCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String message;
  final bool showClose;

  const _SnackbarCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.message,
    this.showClose = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(16),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              if (showClose)
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
