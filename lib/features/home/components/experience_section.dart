import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';
import '../data/portfolio_data.dart';
import '../models/skill_model.dart'; // Keep for WorkExperience type

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints(minHeight: screenHeight * 0.8),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveValue<double>(
          mobile: AppStyle.spacing16,
          tablet: AppStyle.spacing32,
          desktop: AppStyle.spacing64,
        ).getValue(context),
        vertical: AppStyle.spacing48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Experience',
            style: ResponsiveValue<TextStyle>(
              mobile: AppStyle.h3,
              desktop: AppStyle.h2,
            ).getValue(context),
          ).animate().fadeIn().slideX(begin: -0.2, end: 0),

          const SizedBox(height: AppStyle.spacing48),

          // Timeline
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: PortfolioData.workExperience.length,
            itemBuilder: (context, index) {
              final exp = PortfolioData.workExperience[index];
              final isLast = index == PortfolioData.workExperience.length - 1;

              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline Line & Dot
                    SizedBox(
                      width: 40,
                      child: Column(
                        children: [
                          // Top Line (only if not first, but here we want continuous line mostly)
                          // Actually for the first item, we start the line from the dot downwards

                          // The Dot
                          Container(
                            margin: const EdgeInsets.only(
                              top: 24,
                            ), // Align with card top
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.3),
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.5),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),

                          // The Line
                          if (!isLast)
                            Expanded(
                              child: Container(
                                width: 2,
                                color: AppColors.primary.withOpacity(0.3),
                              ),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(width: AppStyle.spacing16),

                    // Content
                    Expanded(
                      child: Padding(
                        // Add some bottom padding for spacing between items
                        padding: const EdgeInsets.only(
                          bottom: AppStyle.spacing32,
                        ),
                        child: _buildExperienceCard(exp, index),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(WorkExperience exp, int index) {
    return GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(exp.title, style: AppStyle.h6),
                        const SizedBox(height: AppStyle.spacing4),
                        Text(
                          exp.company,
                          style: AppStyle.bodyMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (exp.isCurrentRole)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppStyle.spacing12,
                        vertical: AppStyle.spacing4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.5),
                        ),
                        borderRadius: AppStyle.borderRadiusSmall,
                      ),
                      child: Text(
                        'Current',
                        style: AppStyle.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppStyle.spacing8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(width: AppStyle.spacing4),
                  Text(
                    exp.location,
                    style: AppStyle.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(width: AppStyle.spacing16),
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(width: AppStyle.spacing4),
                  Text(
                    _formatDateRange(exp.startDate, exp.endDate),
                    style: AppStyle.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppStyle.spacing16),
              ...exp.responsibilities.map(
                (resp) => Padding(
                  padding: const EdgeInsets.only(bottom: AppStyle.spacing8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(color: AppColors.primary),
                      ),
                      Expanded(child: Text(resp, style: AppStyle.bodySmall)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: (200 + index * 200).ms)
        .slideX(begin: -0.2, end: 0);
  }

  String _formatDateRange(DateTime start, DateTime? end) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final startStr = '${months[start.month - 1]} ${start.year}';
    final endStr = end != null
        ? '${months[end.month - 1]} ${end.year}'
        : 'Present';
    return '$startStr - $endStr';
  }
}
