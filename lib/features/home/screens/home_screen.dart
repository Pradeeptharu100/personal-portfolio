import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_portfolio/features/home/components/about_section.dart';
import 'package:personal_portfolio/features/home/components/contact_section.dart';
import 'package:personal_portfolio/features/home/components/experience_section.dart';
import 'package:personal_portfolio/features/home/components/hero_section.dart';
import 'package:personal_portfolio/features/home/components/projects_section.dart';
import 'package:personal_portfolio/features/home/providers/home_provider.dart';
import 'package:personal_portfolio/features/routes/app_routes.dart';
import 'package:personal_portfolio/features/shared/widgets/animated_background.dart';
import 'package:personal_portfolio/features/shared/widgets/responsive_layout.dart';
import 'package:personal_portfolio/features/themes/app_colors.dart';
import 'package:personal_portfolio/features/themes/app_style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<String> _sections = [
    'Home',
    'About',
    'Experience',
    'Projects',
    'Contact',
  ];

  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final key = _sectionKeys[i];
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        if (position.dy >= -box.size.height / 2 &&
            position.dy < MediaQuery.of(context).size.height / 2) {
          // Update provider without rebuilding the entire screen
          Provider.of<HomeProvider>(this.context, listen: false).setIndex(i);
          break;
        }
      }
    }
  }

  void _scrollToSection(int index) {
    Provider.of<HomeProvider>(context, listen: false).setIndex(index);

    final key = _sectionKeys[index];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: AppStyle.durationSlow,
        curve: AppStyle.curveSmooth,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: Stack(
          children: [
            // Main Content
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(key: _sectionKeys[0]),
                  AboutSection(key: _sectionKeys[1]),
                  ExperienceSection(key: _sectionKeys[2]),
                  ProjectsSection(key: _sectionKeys[3]),
                  ContactSection(key: _sectionKeys[4]),
                ],
              ),
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
                backgroundColor: AppColors.backgroundLight,
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
            // Only rebuild navigation items when index changes
            Consumer<HomeProvider>(
              builder: (context, provider, _) {
                return Row(
                  children: List.generate(
                    _sections.length,
                    (index) => _buildNavItem(index, provider.selectedIndex),
                  ),
                );
              },
            ),
          ],
        ),
      ).animate().fadeIn().slideY(begin: -0.5, end: 0),
    );
  }

  Widget _buildNavItem(int index, int selectedIndex) {
    final isSelected = selectedIndex == index;

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
        child: Consumer<HomeProvider>(
          builder: (context, provider, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                _sections.length,
                (index) => _buildMobileNavItem(index, provider.selectedIndex),
              ),
            );
          },
        ),
      ).animate().fadeIn().slideY(begin: 1, end: 0),
    );
  }

  Widget _buildMobileNavItem(int index, int selectedIndex) {
    final isSelected = selectedIndex == index;
    final icons = [
      Icons.home_rounded,
      Icons.person_rounded,
      Icons.work_history_rounded,
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
