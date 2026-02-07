import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/design/design.dart';
import '../../data/portfolio_data.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.6, curve: Curves.easeOut),
      ),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 50), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < Breakpoints.tablet;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? LayoutConstrains.m2 : LayoutConstrains.l1,
        vertical: LayoutConstrains.xl2,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: MaxWidth.content),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Transform.translate(
                  offset: _slideAnimation.value,
                  child: child,
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                // Greeting
                Text(
                  '👋 Hi, I\'m',
                  style: AppTypo.titleLarge(context).copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
                const SizedBox(height: LayoutConstrains.s2),

                // Name with gradient
                GradientText(
                  text: PersonalInfo.name,
                  style: isMobile
                      ? AppTypo.displaySmall(context)
                      : AppTypo.displayLarge(context),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: LayoutConstrains.s3),

                // Title
                Text(
                  '${PersonalInfo.title} | ${PersonalInfo.subtitle}',
                  style: AppTypo.headlineSmall(context).copyWith(
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: LayoutConstrains.m3),

                // Tagline
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 600,
                  ),
                  child: Text(
                    PersonalInfo.tagline,
                    style: AppTypo.bodyLarge(context).copyWith(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                ),
                const SizedBox(height: LayoutConstrains.l1),

                // CTA Buttons
                Wrap(
                  alignment:
                      isMobile ? WrapAlignment.center : WrapAlignment.start,
                  spacing: LayoutConstrains.m1,
                  runSpacing: LayoutConstrains.s2,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _launchUrl(
                        'mailto:${PersonalInfo.email}?subject=Hello%20Woroud',
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: LayoutConstrains.m3,
                          vertical: LayoutConstrains.m1,
                        ),
                      ),
                      icon: const Icon(Icons.mail_outline, size: 18),
                      label: const Text('Contact Me'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _launchUrl(PersonalInfo.resumeUrl),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: LayoutConstrains.m3,
                          vertical: LayoutConstrains.m1,
                        ),
                      ),
                      icon: const Icon(Icons.download, size: 18),
                      label: const Text('Download CV'),
                    ),
                  ],
                ),
                const SizedBox(height: LayoutConstrains.xl1),

                // Stats row
                _buildStatsRow(isDark, isMobile),

                const SizedBox(height: LayoutConstrains.l1),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow(bool isDark, bool isMobile) {
    return Wrap(
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      spacing: isMobile ? LayoutConstrains.m3 : LayoutConstrains.xl1,
      runSpacing: LayoutConstrains.m2,
      children: [
        _StatItem(
          value: '${Stats.yearsOfExperience}+',
          label: 'Years Experience',
          isDark: isDark,
        ),
        _StatItem(
          value: '${Stats.projectsCompleted}+',
          label: 'Projects',
          isDark: isDark,
        ),
        _StatItem(
          value: '${Stats.appsPublished}+',
          label: 'Apps Published',
          isDark: isDark,
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final bool isDark;

  const _StatItem({
    required this.value,
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(text: value, style: AppTypo.headlineLarge(context)),
        Text(
          label,
          style: AppTypo.bodyMedium(context).copyWith(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}