import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/portfolio_data.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/hover_tooltip.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            'Get In Touch',
            style: ResponsiveValue<TextStyle>(
              mobile: AppStyle.h3,
              desktop: AppStyle.h2,
            ).getValue(context),
          ).animate().fadeIn().slideX(begin: -0.2, end: 0),

          const SizedBox(height: AppStyle.spacing32),

          GlassCard(
            child: Column(
              children: [
                Text(
                  'Let\'s work together!',
                  style: AppStyle.h5,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppStyle.spacing16),
                Text(
                  'Feel free to reach out for collaborations, opportunities, or just a friendly chat.',
                  style: AppStyle.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms).scale(),

          const SizedBox(height: AppStyle.spacing48),

          ResponsiveLayout(
            mobile: Column(
              children: [
                _buildContactInfo(),
                const SizedBox(height: AppStyle.spacing32),
                _buildSocialLinks(),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContactInfo()),
                const SizedBox(width: AppStyle.spacing48),
                Expanded(child: _buildSocialLinks()),
              ],
            ),
          ),

          const SizedBox(height: AppStyle.spacing64),

          // Footer
          Center(
            child: Column(
              children: [
                const Divider(color: AppColors.borderPrimary),
                const SizedBox(height: AppStyle.spacing24),
                Text(
                  '© ${DateTime.now().year} ${PortfolioData.name}. Built with Flutter.',
                  style: AppStyle.bodySmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppStyle.spacing8),
                Text(
                  'Made with ❤️ in Nepal',
                  style: AppStyle.caption.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 800.ms),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: AppStyle.h5,
        ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2, end: 0),

        const SizedBox(height: AppStyle.spacing24),

        _buildContactItem(
          Icons.email_rounded,
          'Email',
          PortfolioData.email,
          () => _launchUrl('mailto:${PortfolioData.email}'),
          0,
        ),

        _buildContactItem(
          Icons.phone_rounded,
          'Phone',
          PortfolioData.phone,
          () => _launchUrl('tel:${PortfolioData.phone}'),
          1,
        ),

        _buildContactItem(
          Icons.location_on_rounded,
          'Location',
          PortfolioData.location,
          null,
          2,
        ),
      ],
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    VoidCallback? onTap,
    int index,
  ) {
    return HoverTooltip(
          message: onTap != null ? 'Click to $label' : value,
          child: MouseRegion(
            cursor: onTap != null
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: GestureDetector(
              onTap: onTap,
              child: GlassCard(
                margin: const EdgeInsets.only(bottom: AppStyle.spacing16),
                padding: const EdgeInsets.all(AppStyle.spacing16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppStyle.spacing12),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: AppStyle.borderRadiusMedium,
                        boxShadow: AppStyle.shadowGlow,
                      ),
                      child: Icon(icon, color: AppColors.textPrimary, size: 24),
                    ),
                    const SizedBox(width: AppStyle.spacing16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: AppStyle.caption.copyWith(
                              color: AppColors.textTertiary,
                            ),
                          ),
                          const SizedBox(height: AppStyle.spacing4),
                          Text(value, style: AppStyle.bodyMedium),
                        ],
                      ),
                    ),
                    if (onTap != null)
                      IconButton(
                        icon: const Icon(Icons.copy, size: 20),
                        onPressed: () => _copyToClipboard(value),
                        tooltip: 'Copy to clipboard',
                      ),
                  ],
                ),
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: (500 + index * 100).ms)
        .slideX(begin: -0.2, end: 0);
  }

  Widget _buildSocialLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect With Me',
          style: AppStyle.h5,
        ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.2, end: 0),

        const SizedBox(height: AppStyle.spacing24),

        _buildSocialButton(
          FontAwesomeIcons.linkedin,
          'LinkedIn',
          'Connect on LinkedIn',
          PortfolioData.linkedIn,
          AppColors.primary,
          0,
        ),

        _buildSocialButton(
          FontAwesomeIcons.github,
          'GitHub',
          'View my repositories',
          PortfolioData.github,
          AppColors.secondary,
          1,
        ),

        _buildSocialButton(
          FontAwesomeIcons.envelope,
          'Email',
          'Send me an email',
          'mailto:${PortfolioData.email}',
          AppColors.accent,
          2,
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    IconData icon,
    String label,
    String description,
    String url,
    Color color,
    int index,
  ) {
    return HoverTooltip(
          message: description,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _launchUrl(url),
              child: GlassCard(
                margin: const EdgeInsets.only(bottom: AppStyle.spacing16),
                padding: const EdgeInsets.all(AppStyle.spacing16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppStyle.spacing12),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: AppStyle.borderRadiusMedium,
                        border: Border.all(color: color, width: 2),
                      ),
                      child: FaIcon(icon, color: color, size: 24),
                    ),
                    const SizedBox(width: AppStyle.spacing16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: AppStyle.h6.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: AppStyle.spacing4),
                          Text(
                            description,
                            style: AppStyle.caption.copyWith(
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_rounded, color: color),
                  ],
                ),
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: (700 + index * 100).ms)
        .slideX(begin: 0.2, end: 0);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
