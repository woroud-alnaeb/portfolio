import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/design/design.dart';
import '../../data/portfolio_data.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
                title: 'Work Experience',
                subtitle: 'My professional journey',
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // Timeline
              ...experiences.asMap().entries.map((entry) {
                final isLast = entry.key == experiences.length - 1;
                return _ExperienceCard(
                  experience: entry.value,
                  isDark: isDark,
                  isMobile: isMobile,
                  isLast: isLast,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final Experience experience;
  final bool isDark;
  final bool isMobile;
  final bool isLast;

  const _ExperienceCard({
    required this.experience,
    required this.isDark,
    required this.isMobile,
    required this.isLast,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isExpanded = false;

  Future<void> _launchUrl(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final exp = widget.experience;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        if (!widget.isMobile)
          SizedBox(
            width: 16,
            child: Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    gradient: exp.current ? AppGradients.primary : null,
                    color: exp.current ? null : AppColors.darkDivider,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: exp.current
                          ? AppColors.primaryPurple
                          : AppColors.darkDivider,
                      width: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (!widget.isMobile) const SizedBox(width: LayoutConstrains.m3),

        // Card content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: LayoutConstrains.m3),
            child: HoverGlassCard(
              padding: const EdgeInsets.all(LayoutConstrains.m3),
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Company logo
                      ClipRRect(
                        borderRadius: BorderRadius.circular(PRadius.button),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            exp.logo,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  gradient: AppGradients.primary,
                                  borderRadius:
                                      BorderRadius.circular(PRadius.button),
                                ),
                                child: Center(
                                  child: Text(
                                    exp.company[0],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: LayoutConstrains.m1),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exp.position,
                              style: AppTypo.titleMedium(context).copyWith(
                                color: widget.isDark
                                    ? AppColors.darkText
                                    : AppColors.lightText,
                              ),
                            ),
                            const SizedBox(height: LayoutConstrains.s1),
                            GestureDetector(
                              onTap: () => _launchUrl(exp.companyUrl),
                              child: Text(
                                exp.company,
                                style: AppTypo.bodyMedium(
                                  context,
                                ).copyWith(color: AppColors.primaryCyan),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Duration badge
                      if (exp.current)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: LayoutConstrains.s3,
                            vertical: LayoutConstrains.s1,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(PRadius.chip),
                          ),
                          child: Text(
                            'Current',
                            style: AppTypo.labelSmall(
                              context,
                            ).copyWith(color: Colors.green),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: LayoutConstrains.s3),

                  // Meta info
                  Wrap(
                    spacing: LayoutConstrains.m1,
                    runSpacing: LayoutConstrains.s1,
                    children: [
                      _MetaChip(
                        icon: Icons.calendar_today,
                        text: exp.duration,
                        isDark: widget.isDark,
                      ),
                      _MetaChip(
                        icon: Icons.location_on,
                        text: exp.location,
                        isDark: widget.isDark,
                      ),
                      _MetaChip(
                        icon: Icons.work,
                        text: exp.type,
                        isDark: widget.isDark,
                      ),
                    ],
                  ),
                  const SizedBox(height: LayoutConstrains.m1),

                  // Description
                  Text(
                    exp.description,
                    style: AppTypo.bodyMedium(context).copyWith(
                      color: widget.isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                  ),

                  // Expandable content
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: const SizedBox.shrink(),
                    secondChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: LayoutConstrains.m2),
                        const Divider(),
                        const SizedBox(height: LayoutConstrains.m1),

                        // Highlights
                        ...exp.highlights.map(
                          (h) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: LayoutConstrains.s3,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  h['icon'] ?? '✨',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: LayoutConstrains.s3),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        h['title'] ?? '',
                                        style: AppTypo.labelLarge(context)
                                            .copyWith(
                                          color: widget.isDark
                                              ? AppColors.darkText
                                              : AppColors.lightText,
                                        ),
                                      ),
                                      Text(
                                        h['description'] ?? '',
                                        style:
                                            AppTypo.bodySmall(context).copyWith(
                                          color: widget.isDark
                                              ? AppColors.darkTextSecondary
                                              : AppColors.lightTextSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Technologies
                        const SizedBox(height: LayoutConstrains.s2),
                        Wrap(
                          spacing: LayoutConstrains.s2,
                          runSpacing: LayoutConstrains.s2,
                          children: exp.technologies
                              .map((tech) => SkillChip(name: tech))
                              .toList(),
                        ),
                      ],
                    ),
                  ),

                  // Expand button
                  const SizedBox(height: LayoutConstrains.s3),
                  Center(
                    child: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.primaryCyan,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isDark;

  const _MetaChip({
    required this.icon,
    required this.text,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: isDark
              ? AppColors.darkTextSecondary
              : AppColors.lightTextSecondary,
        ),
        const SizedBox(width: 4),
        Text(
          text,
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
