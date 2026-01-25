import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:darul_rahman_app/widgets/loading/loading_controller.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final loading = Get.find<LoadingController>();

    return Obx(() {
      if (!loading.isLoading.value) {
        return const SizedBox.shrink();
      }

      return Stack(
        children: [
          // Dark overlay
          ModalBarrier(
            dismissible: false,
            color: Colors.black.withOpacity(0.4),
          ),

          // Center loading card
          const Center(
            child: _LoadingSnackbarCard(
              color: Color(0xFF1E88E5), // primary color
              icon: Icons.hourglass_top_rounded,
              title: 'Processing',
              message: 'Please wait a moment...',
            ),
          ),
        ],
      );
    });
  }
}

class _LoadingSnackbarCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String message;

  const _LoadingSnackbarCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(16),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animated icon
              const _RotatingIcon(),

              const SizedBox(width: 12),

              // Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
            ],
          ),
        ),
      ),
    );
  }
}

class _RotatingIcon extends StatefulWidget {
  const _RotatingIcon();

  @override
  State<_RotatingIcon> createState() => _RotatingIconState();
}

class _RotatingIconState extends State<_RotatingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: const Icon(
        Icons.sync_rounded,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
