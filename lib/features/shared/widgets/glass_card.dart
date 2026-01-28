import 'dart:ui';

import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 1,
    this.boxShadow,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? AppStyle.borderRadiusLarge,
        border: Border.all(
          color: borderColor ?? AppColors.borderPrimary,
          width: borderWidth,
        ),
        boxShadow: boxShadow ?? AppStyle.shadowMedium,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? AppStyle.borderRadiusLarge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: gradient ?? AppColors.glassGradient,
            ),
            padding: padding ?? const EdgeInsets.all(AppStyle.spacing24),
            child: child,
          ),
        ),
      ),
    );
  }
}
