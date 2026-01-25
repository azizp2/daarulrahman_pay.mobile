import 'package:flutter/material.dart';

class AppColors {
  // === BRAND / PRIMARY ===
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF93C5FD);
  static const Color primaryDark = Color(0xFF1E40AF);

  // === BACKGROUND ===
  static const Color background = Colors.white;
  static const Color surface = Color(0xFFF9FAFB);
  static const Color formFill = Colors.white;

  // === BORDER ===
  static const Color border = Color(0xFFD1D5DB);
  static const Color borderFocus = primary;
  static const Color borderError = Color(0xFFEF4444);

  // === TEXT ===
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Colors.white;
  static const Color textDanger = borderError;

  // === STATUS ===
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = borderError;

  // === SHADOW ===
  static const Color shadow = Color(0x1A000000);
}
