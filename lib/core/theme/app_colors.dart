import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color background = Color(0xFF0A1628);
  static const Color surface = Color(0xFF0F1F38);
  static const Color surfaceElevated = Color(0xFF152A4A);
  static const Color border = Color(0xFF243B5C);

  // Palette pulled from the hero portrait (blue wall, gold panel, green attire)
  static const Color photoBlue = Color(0xFF1B75BC);
  static const Color photoYellow = Color(0xFFFFDC00);
  static const Color photoGreen = Color(0xFF004B49);

  static const Color accent = photoBlue;
  static const Color accentSecondary = photoYellow;
  static const Color accentMuted = Color(0xFF2D6BB5);

  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0A1628),
      Color(0xFF0F2240),
      Color(0xFF0A1628),
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [photoBlue, photoYellow],
  );

  static const LinearGradient glowGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x331B75BC),
      Color(0x1AFFDC00),
      Colors.transparent,
    ],
  );
}
