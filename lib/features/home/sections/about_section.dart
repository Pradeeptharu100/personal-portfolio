import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../data/models/skill_model.dart';
import '../../data/portfolio_data.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/hover_tooltip.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveValue<double>(
          mobile: AppStyle.spacing24,
          tablet: AppStyle.spacing48,
          desktop: AppStyle.spacing96,
        ).getValue(context),
        vertical: AppStyle.spacing64,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: ResponsiveValue<TextStyle>(
              mobile: AppStyle.h3,
              desktop: AppStyle.h2,
            ).getValue(context),
          ).animate().fadeIn().slideX(begin: -0.2, end: 0),

          const SizedBox(height: AppStyle.spacing32),

          // Summary
          GlassCard(
            child: Text(PortfolioData.summary, style: AppStyle.bodyLarge),
          ).animate().fadeIn(delay: 200.ms).scale(),

          const SizedBox(height: AppStyle.spacing48),

          // Skills
          Text(
            'Skills',
            style: AppStyle.h4,
          ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2, end: 0),

          const SizedBox(height: AppStyle.spacing24),

          _buildSkillsGrid(context),

          const SizedBox(height: AppStyle.spacing48),

          // Experience
          Text(
            'Experience',
            style: AppStyle.h4,
          ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.2, end: 0),

          const SizedBox(height: AppStyle.spacing24),

          ...PortfolioData.workExperience.asMap().entries.map((entry) {
            return _buildExperienceCard(entry.value, entry.key);
          }),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    final skillsByCategory = <SkillCategory, List<SkillModel>>{};

    for (var skill in PortfolioData.skills) {
      skillsByCategory.putIfAbsent(skill.category, () => []);
      skillsByCategory[skill.category]!.add(skill);
    }

    return ResponsiveLayout(
      mobile: Column(
        children: skillsByCategory.entries.map((entry) {
          return _buildSkillCategory(entry.key, entry.value, 0);
        }).toList(),
      ),
      desktop: Wrap(
        spacing: AppStyle.spacing24,
        runSpacing: AppStyle.spacing24,
        children: skillsByCategory.entries.map((entry) {
          return SizedBox(
            width:
                (MediaQuery.of(context).size.width -
                    AppStyle.spacing96 * 2 -
                    AppStyle.spacing24) /
                2,
            child: _buildSkillCategory(entry.key, entry.value, 0),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSkillCategory(
    SkillCategory category,
    List<SkillModel> skills,
    int index,
  ) {
    return GlassCard(
          margin: const EdgeInsets.only(bottom: AppStyle.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.displayName,
                style: AppStyle.h6.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: AppStyle.spacing16),
              ...skills.map((skill) => _buildSkillBar(skill)),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: (800 + index * 100).ms)
        .slideY(begin: 0.2, end: 0);
  }

  Widget _buildSkillBar(SkillModel skill) {
    return HoverTooltip(
      message: '${(skill.proficiency * 100).toInt()}% proficiency',
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppStyle.spacing12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(skill.name, style: AppStyle.bodySmall),
            const SizedBox(height: AppStyle.spacing4),
            Stack(
              children: [
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.borderPrimary,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: skill.proficiency,
                  child:
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: AppStyle.shadowGlow,
                        ),
                      ).animate().scaleX(
                        begin: 0,
                        end: 1,
                        duration: 800.ms,
                        curve: Curves.easeOut,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(WorkExperience exp, int index) {
    return GlassCard(
          margin: const EdgeInsets.only(bottom: AppStyle.spacing24),
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
                        gradient: AppColors.primaryGradient,
                        borderRadius: AppStyle.borderRadiusSmall,
                      ),
                      child: Text(
                        'Current',
                        style: AppStyle.caption.copyWith(
                          color: AppColors.textPrimary,
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
        .fadeIn(delay: (1000 + index * 200).ms)
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
