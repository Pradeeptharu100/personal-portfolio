import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// AppStyle - Typography, Spacing, and Style Definitions
class AppStyle {
  AppStyle._();

  // Font Family
  static String get primaryFont => GoogleFonts.orbitron().fontFamily!;
  static String get secondaryFont => GoogleFonts.rajdhani().fontFamily!;
  static String get bodyFont => GoogleFonts.inter().fontFamily!;

  // Text Styles - Headings
  static TextStyle h1 = GoogleFonts.orbitron(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -1.5,
  );

  static TextStyle h2 = GoogleFonts.orbitron(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -1.0,
  );

  static TextStyle h3 = GoogleFonts.orbitron(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: -0.5,
  );

  static TextStyle h4 = GoogleFonts.rajdhani(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: 0,
  );

  static TextStyle h5 = GoogleFonts.rajdhani(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle h6 = GoogleFonts.rajdhani(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0.15,
  );

  // Text Styles - Body
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.6,
    letterSpacing: 0.5,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.6,
    letterSpacing: 0.25,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
    letterSpacing: 0.25,
  );

  // Text Styles - Special
  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.4,
    letterSpacing: 0.4,
  );

  static TextStyle overline = GoogleFonts.rajdhani(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textTertiary,
    height: 1.4,
    letterSpacing: 1.5,
  );

  static TextStyle button = GoogleFonts.rajdhani(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: 1.25,
  );

  // Terminal Styles
  static TextStyle terminal = GoogleFonts.sourceCodePro(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.terminalText,
    height: 1.5,
    letterSpacing: 0,
  );

  static TextStyle terminalPrompt = GoogleFonts.sourceCodePro(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.terminalPrompt,
    height: 1.5,
    letterSpacing: 0,
  );

  // Spacing Constants
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;
  static const double spacing96 = 96.0;
  static const double spacing128 = 128.0;

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
  static const double radiusRound = 999.0;

  static BorderRadius get borderRadiusSmall =>
      BorderRadius.circular(radiusSmall);
  static BorderRadius get borderRadiusMedium =>
      BorderRadius.circular(radiusMedium);
  static BorderRadius get borderRadiusLarge =>
      BorderRadius.circular(radiusLarge);
  static BorderRadius get borderRadiusXLarge =>
      BorderRadius.circular(radiusXLarge);
  static BorderRadius get borderRadiusRound =>
      BorderRadius.circular(radiusRound);

  // Shadows
  static List<BoxShadow> get shadowSmall => [
    BoxShadow(
      color: AppColors.shadowDark,
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get shadowMedium => [
    BoxShadow(
      color: AppColors.shadowDark,
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get shadowLarge => [
    BoxShadow(
      color: AppColors.shadowDark,
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> get shadowGlow => [
    BoxShadow(color: AppColors.shadowPrimary, blurRadius: 20, spreadRadius: 2),
  ];

  static List<BoxShadow> shadowGlowColor(Color color) => [
    BoxShadow(color: color.withOpacity(0.4), blurRadius: 20, spreadRadius: 2),
  ];

  // Glass Effect
  static BoxDecoration get glassDecoration => BoxDecoration(
    gradient: AppColors.glassGradient,
    borderRadius: borderRadiusLarge,
    border: Border.all(color: AppColors.borderPrimary, width: 1),
    boxShadow: shadowMedium,
  );

  // Button Decorations
  static BoxDecoration get primaryButtonDecoration => BoxDecoration(
    gradient: AppColors.primaryGradient,
    borderRadius: borderRadiusMedium,
    boxShadow: shadowGlow,
  );

  static BoxDecoration get outlineButtonDecoration => BoxDecoration(
    border: Border.all(color: AppColors.primary, width: 2),
    borderRadius: borderRadiusMedium,
  );

  // Card Decoration
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: AppColors.backgroundMedium,
    borderRadius: borderRadiusLarge,
    border: Border.all(color: AppColors.borderPrimary, width: 1),
    boxShadow: shadowMedium,
  );

  // Durations for animations
  static const Duration durationFast = Duration(milliseconds: 200);
  static const Duration durationMedium = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
  static const Duration durationVerySlow = Duration(milliseconds: 800);

  // Curves for animations
  static const Curve curveDefault = Curves.easeInOut;
  static const Curve curveSmooth = Curves.easeOutCubic;
  static const Curve curveBounce = Curves.elasticOut;
}
