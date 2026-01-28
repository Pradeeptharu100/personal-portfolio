import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../data/portfolio_data.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppStyle.spacing24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Name
              Text(
                PortfolioData.name,
                style: ResponsiveValue<TextStyle>(
                  mobile: AppStyle.h2,
                  tablet: AppStyle.h1,
                  desktop: AppStyle.h1.copyWith(fontSize: 80),
                ).getValue(context),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),

              const SizedBox(height: AppStyle.spacing16),

              // Title with gradient
              ShaderMask(
                    shaderCallback: (bounds) =>
                        AppColors.primaryGradient.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      PortfolioData.title,
                      style: ResponsiveValue<TextStyle>(
                        mobile: AppStyle.h4,
                        tablet: AppStyle.h3,
                        desktop: AppStyle.h2,
                      ).getValue(context).copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 600.ms)
                  .slideY(begin: 0.3, end: 0),

              const SizedBox(height: AppStyle.spacing32),

              // Location
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      const SizedBox(width: AppStyle.spacing8),
                      Text(PortfolioData.location, style: AppStyle.bodyLarge),
                    ],
                  )
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 600.ms)
                  .slideY(begin: 0.3, end: 0),

              const SizedBox(height: AppStyle.spacing48),

              // CTA Buttons
              ResponsiveLayout(
                    mobile: Column(
                      children: [
                        _buildButton(
                          'View Projects',
                          Icons.work_rounded,
                          () {},
                          isPrimary: true,
                        ),
                        const SizedBox(height: AppStyle.spacing16),
                        _buildButton(
                          'Contact Me',
                          Icons.email_rounded,
                          () {},
                          isPrimary: false,
                        ),
                      ],
                    ),
                    desktop: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(
                          'View Projects',
                          Icons.work_rounded,
                          () {},
                          isPrimary: true,
                        ),
                        const SizedBox(width: AppStyle.spacing24),
                        _buildButton(
                          'Contact Me',
                          Icons.email_rounded,
                          () {},
                          isPrimary: false,
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 900.ms, duration: 600.ms)
                  .scale(begin: const Offset(0.8, 0.8)),

              const Spacer(),

              // Scroll indicator
              Column(
                    children: [
                      Text('Scroll Down', style: AppStyle.caption),
                      const SizedBox(height: AppStyle.spacing8),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primary,
                      ),
                    ],
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .fadeIn(delay: 1200.ms)
                  .moveY(
                    begin: 0,
                    end: 10,
                    duration: 1000.ms,
                    curve: Curves.easeInOut,
                  ),

              const SizedBox(height: AppStyle.spacing48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    String label,
    IconData icon,
    VoidCallback onPressed, {
    required bool isPrimary,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyle.spacing32,
            vertical: AppStyle.spacing16,
          ),
          decoration: isPrimary
              ? AppStyle.primaryButtonDecoration
              : AppStyle.outlineButtonDecoration,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.textPrimary, size: 20),
              const SizedBox(width: AppStyle.spacing12),
              Text(label, style: AppStyle.button),
            ],
          ),
        ),
      ),
    );
  }
}
