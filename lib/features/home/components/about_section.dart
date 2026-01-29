import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/hover_tooltip.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';
import '../data/portfolio_data.dart';
import '../models/skill_model.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          Text(
            'About Me',
            style: ResponsiveValue<TextStyle>(
              mobile: AppStyle.h3,
              desktop: AppStyle.h2,
            ).getValue(context),
          ).animate().fadeIn().slideX(begin: -0.2, end: 0),

          const SizedBox(height: AppStyle.spacing24),

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

          const SizedBox(height: AppStyle.spacing24),

          _buildSkillsGrid(context),
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
}
