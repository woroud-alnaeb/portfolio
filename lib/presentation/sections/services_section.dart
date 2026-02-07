import 'package:flutter/material.dart';
import '../../common/design/design.dart';
import '../../data/portfolio_data.dart';

class ServicesSection extends StatelessWidget {
  final VoidCallback? onContactTap;

  const ServicesSection({super.key, this.onContactTap});

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
            children: [
              const SectionTitle(
                title: 'Freelance Services',
                subtitle: 'How I can help you',
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // Services grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 3,
                  mainAxisSpacing: LayoutConstrains.m2,
                  crossAxisSpacing: LayoutConstrains.m2,
                  mainAxisExtent: 340,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return _ServiceCard(
                    service: services[index],
                    isDark: isDark,
                    index: index,
                  );
                },
              ),

              const SizedBox(height: LayoutConstrains.l1),

              // CTA
              GlassCard(
                padding: const EdgeInsets.all(LayoutConstrains.l1),
                child: Column(
                  children: [
                    Text(
                      'Ready to start a project?',
                      style: AppTypo.headlineSmall(context).copyWith(
                        color:
                            isDark ? AppColors.darkText : AppColors.lightText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: LayoutConstrains.s3),
                    Text(
                      'I\'m available for freelance work. Let\'s discuss your project!',
                      style: AppTypo.bodyMedium(context).copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: LayoutConstrains.m3),
                    ElevatedButton.icon(
                      onPressed: onContactTap,
                      icon: const Icon(Icons.mail_outline, size: 18),
                      label: const Text('Get in Touch'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceItem service;
  final bool isDark;
  final int index;

  const _ServiceCard({
    required this.service,
    required this.isDark,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppColors.primaryPurple,
      AppColors.primaryCyan,
      AppColors.primaryPink,
    ];
    final color = colors[index % colors.length];

    return HoverGlassCard(
      padding: const EdgeInsets.all(LayoutConstrains.m2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(PRadius.button),
            ),
            child: Center(
              child: Text(service.icon, style: const TextStyle(fontSize: 24)),
            ),
          ),
          const SizedBox(height: LayoutConstrains.m1),

          // Title
          Text(
            service.title,
            style: AppTypo.titleMedium(context).copyWith(
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
          const SizedBox(height: LayoutConstrains.s2),

          // Description
          Text(
            service.description,
            style: AppTypo.bodySmall(context).copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: LayoutConstrains.s3),

          // Features
          const Spacer(),
          ...service.features.take(4).map(
                (feature) => Padding(
                  padding: const EdgeInsets.only(bottom: LayoutConstrains.s1),
                  child: Row(
                    children: [
                      Icon(Icons.check, size: 14, color: color),
                      const SizedBox(width: LayoutConstrains.s2),
                      Expanded(
                        child: Text(
                          feature,
                          style: AppTypo.labelSmall(context).copyWith(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
