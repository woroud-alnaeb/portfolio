import 'package:flutter/material.dart';
import '../../common/design/design.dart';
import '../../theme_provider.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/services_section.dart';
import '../sections/mentorship_section.dart';
import '../sections/contact_section.dart';
import 'widgets/nav_bar.dart';
import 'widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const HomeScreen({super.key, required this.themeProvider});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for navigation
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _mentorshipKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;

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
    final showButton = _scrollController.offset > 400;
    if (showButton != _showBackToTop) {
      setState(() => _showBackToTop = showButton);
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: Stack(
        children: [
          // Background orbs (only in dark mode for performance)
          if (isDark) const OrbsBackground(),

          // Main content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Navigation Bar
              SliverToBoxAdapter(
                child: NavBar(
                  themeProvider: widget.themeProvider,
                  onNavItemTap: (index) {
                    switch (index) {
                      case 0:
                        _scrollToSection(_aboutKey);
                        break;
                      case 1:
                        _scrollToSection(_skillsKey);
                        break;
                      case 2:
                        _scrollToSection(_experienceKey);
                        break;
                      case 3:
                        _scrollToSection(_projectsKey);
                        break;
                      case 4:
                        _scrollToSection(_servicesKey);
                        break;
                      case 5:
                        _scrollToSection(_contactKey);
                        break;
                    }
                  },
                ),
              ),

              // Hero Section
              SliverToBoxAdapter(key: _heroKey, child: const HeroSection()),

              // About Section
              SliverToBoxAdapter(key: _aboutKey, child: const AboutSection()),

              // Skills Section
              SliverToBoxAdapter(key: _skillsKey, child: const SkillsSection()),

              // Experience Section
              SliverToBoxAdapter(
                key: _experienceKey,
                child: const ExperienceSection(),
              ),

              // Projects Section
              SliverToBoxAdapter(
                key: _projectsKey,
                child: const ProjectsSection(),
              ),

              // Services Section
              SliverToBoxAdapter(
                key: _servicesKey,
                child: ServicesSection(
                  onContactTap: () => _scrollToSection(_contactKey),
                ),
              ),

              // Mentorship Section
              SliverToBoxAdapter(
                key: _mentorshipKey,
                child: const MentorshipSection(),
              ),

              // Contact Section
              SliverToBoxAdapter(
                key: _contactKey,
                child: const ContactSection(),
              ),

              // Footer
              const SliverToBoxAdapter(child: Footer()),
            ],
          ),

          // Back to top button
          Positioned(
            bottom: LayoutConstrains.m3,
            right: LayoutConstrains.m3,
            child: AnimatedOpacity(
              opacity: _showBackToTop ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: AnimatedScale(
                scale: _showBackToTop ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: FloatingActionButton(
                  mini: true,
                  onPressed: _scrollToTop,
                  backgroundColor: AppColors.primaryPurple,
                  child: const Icon(Icons.arrow_upward, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
