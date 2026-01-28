import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';

class HoverTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final bool enabled;

  const HoverTooltip({
    super.key,
    required this.child,
    required this.message,
    this.enabled = true,
  });

  @override
  State<HoverTooltip> createState() => _HoverTooltipState();
}

class _HoverTooltipState extends State<HoverTooltip> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Tooltip(
        message: widget.message,
        preferBelow: false,
        verticalOffset: 20,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: AppStyle.borderRadiusSmall,
          border: Border.all(color: AppColors.primary, width: 1),
          boxShadow: AppStyle.shadowGlow,
        ),
        textStyle: AppStyle.bodySmall.copyWith(color: AppColors.textPrimary),
        waitDuration: const Duration(milliseconds: 500),
        child: AnimatedScale(
          scale: _isHovering ? 1.05 : 1.0,
          duration: AppStyle.durationFast,
          curve: AppStyle.curveDefault,
          child: widget.child,
        ),
      ),
    );
  }
}
