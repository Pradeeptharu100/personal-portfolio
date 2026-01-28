import 'package:flutter/material.dart';

/// AppColors - Futuristic Dark Theme Color Palette
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF00D9FF); // Cyan
  static const Color primaryDark = Color(0xFF00A8CC);
  static const Color primaryLight = Color(0xFF66E5FF);

  // Secondary Colors
  static const Color secondary = Color(0xFFB24BF3); // Purple
  static const Color secondaryDark = Color(0xFF8B2FC9);
  static const Color secondaryLight = Color(0xFFC97BF5);

  // Accent Colors
  static const Color accent = Color(0xFFFF006E); // Pink
  static const Color accentDark = Color(0xFFCC0058);
  static const Color accentLight = Color(0xFFFF4D94);

  // Background Colors
  static const Color backgroundDark = Color(0xFF0A0E27); // Deep blue-black
  static const Color backgroundMedium = Color(0xFF151B3D);
  static const Color backgroundLight = Color(0xFF1E2749);

  // Surface Colors (for glassmorphism)
  static const Color surfaceDark = Color(0x1AFFFFFF); // 10% white
  static const Color surfaceMedium = Color(0x33FFFFFF); // 20% white
  static const Color surfaceLight = Color(0x4DFFFFFF); // 30% white

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF); // White
  static const Color textSecondary = Color(0xFFB8C5D6); // Light gray
  static const Color textTertiary = Color(0xFF6B7A94); // Medium gray
  static const Color textDisabled = Color(0xFF3D4A5C); // Dark gray

  // Status Colors
  static const Color success = Color(0xFF00FF88);
  static const Color warning = Color(0xFFFFB800);
  static const Color error = Color(0xFFFF3D71);
  static const Color info = Color(0xFF00D9FF);

  // Terminal Colors
  static const Color terminalBackground = Color(0xFF0D1117);
  static const Color terminalText = Color(0xFF00FF41); // Matrix green
  static const Color terminalCursor = Color(0xFF00D9FF);
  static const Color terminalPrompt = Color(0xFFB24BF3);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [backgroundDark, backgroundMedium, Color(0xFF0F1535)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, secondary, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [surfaceLight, surfaceDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Radial Gradients for effects
  static RadialGradient glowGradient(Color color) => RadialGradient(
    colors: [
      color.withOpacity(0.6),
      color.withOpacity(0.3),
      color.withOpacity(0.0),
    ],
    stops: const [0.0, 0.5, 1.0],
  );

  // Shimmer Colors
  static const Color shimmerBase = Color(0xFF1E2749);
  static const Color shimmerHighlight = Color(0xFF2A3458);

  // Border Colors
  static const Color borderPrimary = Color(0xFF2A3458);
  static const Color borderSecondary = Color(0xFF1E2749);
  static const Color borderAccent = primary;

  // Shadow Colors
  static Color shadowPrimary = primary.withOpacity(0.3);
  static Color shadowSecondary = secondary.withOpacity(0.3);
  static Color shadowDark = Colors.black.withOpacity(0.5);
}
