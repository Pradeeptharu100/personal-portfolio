import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';
import '../shared/widgets/animated_background.dart';
import '../shared/widgets/responsive_layout.dart';
import '../themes/app_colors.dart';
import '../themes/app_style.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  final List<String> _sections = ['Home', 'About', 'Projects', 'Contact'];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    setState(() => _selectedIndex = index);

    final screenHeight = MediaQuery.of(context).size.height;
    final targetOffset = screenHeight * index;

    _scrollController.animateTo(
      targetOffset,
      duration: AppStyle.durationSlow,
      curve: AppStyle.curveSmooth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: Stack(
          children: [
            // Main Content
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                const SliverToBoxAdapter(child: HeroSection()),
                const SliverToBoxAdapter(child: AboutSection()),
                const SliverToBoxAdapter(child: ProjectsSection()),
                const SliverToBoxAdapter(child: ContactSection()),
              ],
            ),

            // Navigation
            ResponsiveLayout(
              mobile: _buildMobileNav(),
              desktop: _buildDesktopNav(),
            ),

            // Floating Terminal Button
            Positioned(
              right: AppStyle.spacing24,
              bottom: AppStyle.spacing24,
              child: FloatingActionButton.extended(
                onPressed: () => context.push(AppRoutes.terminalPath),
                icon: const Icon(Icons.terminal),
                label: const Text('Terminal'),
                backgroundColor: AppColors.primary,
              ).animate().fadeIn(delay: 1000.ms).scale(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopNav() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyle.spacing48,
          vertical: AppStyle.spacing24,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundDark.withOpacity(0.9),
              AppColors.backgroundDark.withOpacity(0.0),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'PT',
              style: AppStyle.h4.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: List.generate(
                _sections.length,
                (index) => _buildNavItem(index),
              ),
            ),
          ],
        ),
      ).animate().fadeIn().slideY(begin: -0.5, end: 0),
    );
  }

  Widget _buildNavItem(int index) {
    final isSelected = _selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.spacing16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _scrollToSection(index),
          child: AnimatedContainer(
            duration: AppStyle.durationFast,
            padding: const EdgeInsets.symmetric(
              horizontal: AppStyle.spacing16,
              vertical: AppStyle.spacing8,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              _sections[index],
              style: AppStyle.button.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNav() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppStyle.spacing12),
        decoration: BoxDecoration(
          color: AppColors.backgroundMedium,
          border: Border(
            top: BorderSide(color: AppColors.borderPrimary, width: 1),
          ),
          boxShadow: AppStyle.shadowLarge,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _sections.length,
            (index) => _buildMobileNavItem(index),
          ),
        ),
      ).animate().fadeIn().slideY(begin: 1, end: 0),
    );
  }

  Widget _buildMobileNavItem(int index) {
    final isSelected = _selectedIndex == index;
    final icons = [
      Icons.home_rounded,
      Icons.person_rounded,
      Icons.work_rounded,
      Icons.contact_mail_rounded,
    ];

    return GestureDetector(
      onTap: () => _scrollToSection(index),
      child: AnimatedContainer(
        duration: AppStyle.durationFast,
        padding: const EdgeInsets.all(AppStyle.spacing12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: AppStyle.borderRadiusMedium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icons[index],
              color: isSelected ? AppColors.primary : AppColors.textTertiary,
              size: 24,
            ),
            const SizedBox(height: AppStyle.spacing4),
            Text(
              _sections[index],
              style: AppStyle.caption.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textTertiary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
