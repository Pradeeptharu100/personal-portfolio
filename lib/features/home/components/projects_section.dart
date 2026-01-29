import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/hover_tooltip.dart';
import '../../shared/widgets/project_icon.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';
import '../data/portfolio_data.dart';
import '../models/project_model.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints(minHeight: screenHeight * 0.8),
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
            'Projects',
            style: ResponsiveValue<TextStyle>(
              mobile: AppStyle.h3,
              desktop: AppStyle.h2,
            ).getValue(context),
          ).animate().fadeIn().slideX(begin: -0.2, end: 0),

          const SizedBox(height: AppStyle.spacing32),

          ResponsiveLayout(
            mobile: Column(
              children: PortfolioData.projects
                  .asMap()
                  .entries
                  .map(
                    (entry) =>
                        _buildProjectCard(context, entry.value, entry.key),
                  )
                  .toList(),
            ),
            tablet: Wrap(
              spacing: AppStyle.spacing24,
              runSpacing: AppStyle.spacing24,
              children: PortfolioData.projects
                  .asMap()
                  .entries
                  .map(
                    (entry) => SizedBox(
                      width:
                          (MediaQuery.of(context).size.width -
                              AppStyle.spacing48 * 2 -
                              AppStyle.spacing24) /
                          2,
                      child: _buildProjectCard(context, entry.value, entry.key),
                    ),
                  )
                  .toList(),
            ),
            desktop: Wrap(
              spacing: AppStyle.spacing24,
              runSpacing: AppStyle.spacing24,
              children: PortfolioData.projects
                  .asMap()
                  .entries
                  .map(
                    (entry) => SizedBox(
                      width:
                          (MediaQuery.of(context).size.width -
                              AppStyle.spacing96 * 2 -
                              AppStyle.spacing24 * 2) /
                          3,
                      child: _buildProjectCard(context, entry.value, entry.key),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    ProjectModel project,
    int index,
  ) {
    return HoverTooltip(
      message: 'Click to view details',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _showProjectDetails(context, project),
          child: GlassCard(
            margin: const EdgeInsets.only(bottom: AppStyle.spacing24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Icon and Type Badge Row
                Row(
                  children: [
                    ProjectIcon(size: 32),
                    const SizedBox(width: AppStyle.spacing12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppStyle.spacing12,
                          vertical: AppStyle.spacing4,
                        ),
                        decoration: BoxDecoration(
                          gradient: _getGradientForType(project.type),
                          borderRadius: AppStyle.borderRadiusSmall,
                        ),
                        child: Text(
                          project.company != null
                              ? '${project.type.displayName} | ${project.company}'
                              : project.type.displayName,
                          style: AppStyle.caption.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppStyle.spacing16),

                // Project Name
                Text(
                  project.name,
                  style: AppStyle.h6,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                if (project.company != null) ...[
                  const SizedBox(height: AppStyle.spacing4),
                  Text(
                    project.company!,
                    style: AppStyle.bodySmall.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],

                const SizedBox(height: AppStyle.spacing12),

                // Description
                Text(
                  project.description,
                  style: AppStyle.bodySmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: AppStyle.spacing16),

                // Technologies
                Wrap(
                  spacing: AppStyle.spacing8,
                  runSpacing: AppStyle.spacing8,
                  children: project.technologies.take(4).map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppStyle.spacing8,
                        vertical: AppStyle.spacing4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceDark,
                        borderRadius: AppStyle.borderRadiusSmall,
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        tech,
                        style: AppStyle.caption.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                if (project.technologies.length > 4) ...[
                  const SizedBox(height: AppStyle.spacing8),
                  Text(
                    '+${project.technologies.length - 4} more',
                    style: AppStyle.caption.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],

                const SizedBox(height: AppStyle.spacing16),

                // Links
                Row(
                  children: [
                    if (project.playStoreUrl != null)
                      _buildLinkButton(
                        Icons.shop,
                        'Play Store',
                        () => _launchUrl(project.playStoreUrl!),
                      ),
                    if (project.githubUrl != null) ...[
                      const SizedBox(width: AppStyle.spacing8),
                      _buildLinkButton(
                        Icons.code,
                        'GitHub',
                        () => _launchUrl(project.githubUrl!),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: (200 + index * 100).ms).slideY(begin: 0.2, end: 0);
  }

  Widget _buildLinkButton(IconData icon, String label, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyle.spacing12,
            vertical: AppStyle.spacing8,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary, width: 1),
            borderRadius: AppStyle.borderRadiusSmall,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: AppColors.primary),
              const SizedBox(width: AppStyle.spacing4),
              Text(
                label,
                style: AppStyle.caption.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LinearGradient _getGradientForType(ProjectType type) {
    // Return simpler gradients or solid-like gradients as per user request
    switch (type) {
      case ProjectType.professional:
        return LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.2),
            AppColors.primary.withOpacity(0.1),
          ],
        );
      case ProjectType.freelance:
        return LinearGradient(
          colors: [
            AppColors.secondary.withOpacity(0.2),
            AppColors.secondary.withOpacity(0.1),
          ],
        );
      case ProjectType.personal:
        return LinearGradient(
          colors: [
            AppColors.accent.withOpacity(0.2),
            AppColors.accent.withOpacity(0.1),
          ],
        );
    }
  }

  void _showProjectDetails(BuildContext context, ProjectModel project) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(AppStyle.spacing32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(project.name, style: AppStyle.h4)),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: AppStyle.spacing16),
                Text(
                  project.longDescription ?? project.description,
                  style: AppStyle.bodyMedium,
                ),
                const SizedBox(height: AppStyle.spacing24),
                Text('Technologies', style: AppStyle.h6),
                const SizedBox(height: AppStyle.spacing12),
                Wrap(
                  spacing: AppStyle.spacing8,
                  runSpacing: AppStyle.spacing8,
                  children: project.technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppStyle.spacing12,
                        vertical: AppStyle.spacing8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceDark,
                        borderRadius: AppStyle.borderRadiusSmall,
                        border: Border.all(color: AppColors.primary, width: 1),
                      ),
                      child: Text(
                        tech,
                        style: AppStyle.bodySmall.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                if (project.playStoreUrl != null ||
                    project.githubUrl != null) ...[
                  const SizedBox(height: AppStyle.spacing24),
                  Row(
                    children: [
                      if (project.playStoreUrl != null)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(project.playStoreUrl!),
                            icon: const Icon(Icons.shop),
                            label: const Text('Play Store'),
                          ),
                        ),
                      if (project.githubUrl != null) ...[
                        const SizedBox(width: AppStyle.spacing16),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _launchUrl(project.githubUrl!),
                            icon: const Icon(Icons.code),
                            label: const Text('GitHub'),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
