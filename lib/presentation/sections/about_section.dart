import 'package:flutter/material.dart';
import '../../common/design/design.dart';
import '../../data/portfolio_data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
      color: isDark
          ? AppColors.darkSurface.withOpacity(0.5)
          : AppColors.lightSurface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: MaxWidth.content),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: 'About Me',
                subtitle: 'Get to know me better',
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // Bio text
              Text(
                About.longBio,
                style: AppTypo.bodyLarge(context).copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: LayoutConstrains.xl1),

              // Highlights grid
              _buildHighlightsGrid(context, isDark, isMobile),
              const SizedBox(height: LayoutConstrains.xl1),

              // Fun facts
              const SectionTitle(
                title: 'Fun Facts',
                useGradient: false,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: LayoutConstrains.m3),
              _buildFunFacts(context, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightsGrid(
    BuildContext context,
    bool isDark,
    bool isMobile,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        mainAxisSpacing: LayoutConstrains.m2,
        crossAxisSpacing: LayoutConstrains.m2,
        mainAxisExtent: 140,
      ),
      itemCount: About.highlights.length,
      itemBuilder: (context, index) {
        final highlight = About.highlights[index];
        return HoverGlassCard(
          padding: const EdgeInsets.all(LayoutConstrains.m3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                highlight['icon'] ?? '✨',
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: LayoutConstrains.m1),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      highlight['title'] ?? '',
                      style: AppTypo.titleMedium(context).copyWith(
                        color: isDark
                            ? AppColors.darkText
                            : AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: LayoutConstrains.s2),
                    Expanded(
                      child: Text(
                        highlight['description'] ?? '',
                        style: AppTypo.bodySmall(context).copyWith(
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFunFacts(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: About.funFacts.map((fact) {
        return Padding(
          padding: const EdgeInsets.only(bottom: LayoutConstrains.s3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primaryCyan,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: LayoutConstrains.m1),
              Expanded(
                child: Text(
                  fact,
                  style: AppTypo.bodyMedium(context).copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
