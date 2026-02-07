import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/design/design.dart';
import '../../data/portfolio_data.dart';

class MentorshipSection extends StatelessWidget {
  const MentorshipSection({super.key});

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
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? LayoutConstrains.m2 : LayoutConstrains.l1,
        vertical: LayoutConstrains.xl2,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: MaxWidth.content),
          child: Column(
            children: [
              const SectionTitle(
                title: 'Mentorship & Training',
                subtitle: 'Helping developers grow',
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // Main card
              HoverGlassCard(
                padding: EdgeInsets.zero,
                onTap: () => _launchUrl(MentorshipInfo.roadmapLink),
                child: isMobile
                    ? _buildMobileLayout(context, isDark)
                    : _buildDesktopLayout(context, isDark),
              ),

              const SizedBox(height: LayoutConstrains.l1),

              // Stats
              _buildStatsRow(context, isDark, isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Cover image
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(PRadius.glass),
              bottomLeft: Radius.circular(PRadius.glass),
            ),
            child: SizedBox(
              height: 280,
              child: Image.asset(
                MentorshipInfo.coverImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: AppGradients.primary,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.route,
                        size: 64,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        // Content
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(LayoutConstrains.l1),
            child: _buildContent(context, isDark),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cover image
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(PRadius.glass),
            topRight: Radius.circular(PRadius.glass),
          ),
          child: SizedBox(
            height: 180,
            width: double.infinity,
            child: Image.asset(
              MentorshipInfo.coverImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: AppGradients.primary,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.route,
                      size: 64,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        // Content
        Padding(
          padding: const EdgeInsets.all(LayoutConstrains.m3),
          child: _buildContent(context, isDark),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstrains.s3,
            vertical: LayoutConstrains.s1,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryCyan.withOpacity(0.1),
            borderRadius: BorderRadius.circular(PRadius.chip),
          ),
          child: Text(
            '🎓 Free Resource',
            style: AppTypo.labelSmall(
              context,
            ).copyWith(color: AppColors.primaryCyan),
          ),
        ),
        const SizedBox(height: LayoutConstrains.m1),

        // Title
        Text(
          MentorshipInfo.title,
          style: AppTypo.headlineSmall(
            context,
          ).copyWith(color: isDark ? AppColors.darkText : AppColors.lightText),
        ),
        const SizedBox(height: LayoutConstrains.s3),

        // Description
        Text(
          MentorshipInfo.description,
          style: AppTypo.bodyMedium(context).copyWith(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: LayoutConstrains.m3),

        // Key points
        _buildKeyPoint(
          context,
          isDark,
          '✅',
          'Comprehensive curriculum from basics to advanced',
        ),
        _buildKeyPoint(context, isDark, '✅', 'Real-world project guidance'),
        _buildKeyPoint(
          context,
          isDark,
          '✅',
          'Based on 3+ years of mentoring experience',
        ),
        const SizedBox(height: LayoutConstrains.m3),

        // CTA
        OutlinedButton.icon(
          onPressed: () => _launchUrl(MentorshipInfo.roadmapLink),
          icon: const Icon(Icons.open_in_new, size: 16),
          label: const Text('View Roadmap'),
        ),
      ],
    );
  }

  Widget _buildKeyPoint(
    BuildContext context,
    bool isDark,
    String emoji,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: LayoutConstrains.s2),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: LayoutConstrains.s2),
          Expanded(
            child: Text(
              text,
              style: AppTypo.bodySmall(context).copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, bool isDark, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(
          icon: Icons.people,
          value: '${MentorshipInfo.studentsMentored}+',
          label: 'Students Mentored',
          isDark: isDark,
        ),
        Container(
          width: 1,
          height: 40,
          color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
        ),
        _StatItem(
          icon: Icons.trending_up,
          value: '${MentorshipInfo.successStories}',
          label: 'Success Stories',
          isDark: isDark,
        ),
        Container(
          width: 1,
          height: 40,
          color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
        ),
        _StatItem(
          icon: Icons.star,
          value: '100%',
          label: 'Retention Rate',
          isDark: isDark,
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final bool isDark;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24, color: AppColors.primaryCyan),
        const SizedBox(height: LayoutConstrains.s2),
        Text(
          value,
          style: AppTypo.titleLarge(context).copyWith(
            color: isDark ? AppColors.darkText : AppColors.lightText,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AppTypo.labelSmall(context).copyWith(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}
