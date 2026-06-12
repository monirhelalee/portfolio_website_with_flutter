import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color background = Color(0xFF0B1120);
  static const Color surface = Color(0xFF131B2E);
  static const Color surfaceElevated = Color(0xFF1A2438);
  static const Color border = Color(0xFF2A3548);

  static const Color accent = Color(0xFF22D3EE);
  static const Color accentSecondary = Color(0xFFA78BFA);
  static const Color accentMuted = Color(0xFF0891B2);

  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0B1120), Color(0xFF131B2E), Color(0xFF0F172A)],
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentSecondary],
  );

  static const LinearGradient glowGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x3322D3EE),
      Color(0x1AA78BFA),
      Colors.transparent,
    ],
  );
}
