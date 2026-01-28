import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_style.dart';

/// AppThemes - Theme Configuration
class AppThemes {
  AppThemes._();

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,

    // Color Scheme
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      surface: AppColors.backgroundMedium,
      error: AppColors.error,
      onPrimary: AppColors.textPrimary,
      onSecondary: AppColors.textPrimary,
      onSurface: AppColors.textSecondary,
      onError: AppColors.textPrimary,
    ),

    // Scaffold
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppStyle.h5,
      iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: AppStyle.h1,
      displayMedium: AppStyle.h2,
      displaySmall: AppStyle.h3,
      headlineLarge: AppStyle.h4,
      headlineMedium: AppStyle.h5,
      headlineSmall: AppStyle.h6,
      bodyLarge: AppStyle.bodyLarge,
      bodyMedium: AppStyle.bodyMedium,
      bodySmall: AppStyle.bodySmall,
      labelLarge: AppStyle.button,
      labelMedium: AppStyle.caption,
      labelSmall: AppStyle.overline,
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: AppColors.primary, size: 24),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.backgroundMedium,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyle.borderRadiusLarge,
        side: const BorderSide(color: AppColors.borderPrimary, width: 1),
      ),
      margin: const EdgeInsets.all(AppStyle.spacing8),
    ),

    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyle.spacing32,
          vertical: AppStyle.spacing16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppStyle.borderRadiusMedium,
        ),
        textStyle: AppStyle.button,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 2),
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyle.spacing32,
          vertical: AppStyle.spacing16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppStyle.borderRadiusMedium,
        ),
        textStyle: AppStyle.button,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyle.spacing24,
          vertical: AppStyle.spacing12,
        ),
        textStyle: AppStyle.button,
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundLight,
      border: OutlineInputBorder(
        borderRadius: AppStyle.borderRadiusMedium,
        borderSide: const BorderSide(color: AppColors.borderPrimary, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppStyle.borderRadiusMedium,
        borderSide: const BorderSide(color: AppColors.borderPrimary, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppStyle.borderRadiusMedium,
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppStyle.borderRadiusMedium,
        borderSide: const BorderSide(color: AppColors.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppStyle.borderRadiusMedium,
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppStyle.spacing16,
        vertical: AppStyle.spacing16,
      ),
      hintStyle: AppStyle.bodyMedium.copyWith(color: AppColors.textTertiary),
      labelStyle: AppStyle.bodyMedium.copyWith(color: AppColors.textSecondary),
    ),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.borderPrimary,
      thickness: 1,
      space: AppStyle.spacing24,
    ),

    // Tooltip Theme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: AppStyle.borderRadiusSmall,
        border: Border.all(color: AppColors.primary, width: 1),
        boxShadow: AppStyle.shadowMedium,
      ),
      textStyle: AppStyle.bodySmall.copyWith(color: AppColors.textPrimary),
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyle.spacing12,
        vertical: AppStyle.spacing8,
      ),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearTrackColor: AppColors.borderPrimary,
      circularTrackColor: AppColors.borderPrimary,
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textPrimary,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: AppStyle.borderRadiusLarge),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundMedium,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textTertiary,
      selectedLabelStyle: AppStyle.caption.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppStyle.caption,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Drawer Theme
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.backgroundMedium,
      elevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppStyle.radiusLarge),
          bottomRight: Radius.circular(AppStyle.radiusLarge),
        ),
      ),
    ),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.backgroundMedium,
      elevation: 24,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyle.borderRadiusLarge,
        side: const BorderSide(color: AppColors.borderPrimary, width: 1),
      ),
      titleTextStyle: AppStyle.h5,
      contentTextStyle: AppStyle.bodyMedium,
    ),

    // Snackbar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.backgroundLight,
      contentTextStyle: AppStyle.bodyMedium,
      shape: RoundedRectangleBorder(borderRadius: AppStyle.borderRadiusMedium),
      behavior: SnackBarBehavior.floating,
      elevation: 8,
    ),
  );
}
