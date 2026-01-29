import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class ProjectIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ProjectIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color ?? AppColors.primary,
            AppColors.primary.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(size * 0.2),
        boxShadow: [
          BoxShadow(
            color: (color ?? AppColors.primary).withOpacity(0.3),
            blurRadius: size * 0.3,
            offset: Offset(0, size * 0.1),
          ),
        ],
      ),
      child: Icon(
        Icons.apps,
        color: Colors.white,
        size: size * 0.6,
      ),
    );
  }
}
