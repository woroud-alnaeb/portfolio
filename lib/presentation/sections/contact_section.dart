import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/design/design.dart';
import '../../data/portfolio_data.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
      color: isDark
          ? AppColors.darkSurface.withOpacity(0.5)
          : AppColors.lightSurface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: MaxWidth.narrow),
          child: Column(
            children: [
              // Headline
              GradientText(
                text: CallToAction.headline,
                style: isMobile
                    ? AppTypo.headlineMedium(context)
                    : AppTypo.headlineLarge(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: LayoutConstrains.m2),

              // Subheadline
              Text(
                CallToAction.subheadline,
                style: AppTypo.bodyLarge(context).copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // // Availability badge
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: LayoutConstrains.m2,
              //     vertical: LayoutConstrains.s3,
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.green.withOpacity(0.1),
              //     borderRadius: BorderRadius.circular(PRadius.chip),
              //     border: Border.all(color: Colors.green.withOpacity(0.3)),
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Container(
              //         width: 10,
              //         height: 10,
              //         decoration: const BoxDecoration(
              //           color: Colors.green,
              //           shape: BoxShape.circle,
              //         ),
              //       ),
              //       const SizedBox(width: LayoutConstrains.s3),
              //       Text(
              //         CallToAction.availability,
              //         style: AppTypo.labelMedium(
              //           context,
              //         ).copyWith(color: Colors.green),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: LayoutConstrains.l1),

              // Preferred roles
              Text(
                'Looking for roles:',
                style: AppTypo.labelLarge(context).copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
              const SizedBox(height: LayoutConstrains.s3),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: LayoutConstrains.s2,
                runSpacing: LayoutConstrains.s2,
                children: CallToAction.preferredRoles
                    .map((role) => SkillChip(name: role))
                    .toList(),
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // Contact options
              _buildContactOptions(context, isDark, isMobile),
              const SizedBox(height: LayoutConstrains.l1),

              // Social links
              Text(
                'Or find me on',
                style: AppTypo.bodyMedium(context).copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
              const SizedBox(height: LayoutConstrains.m1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    url: SocialLinks.linkedin,
                    label: 'LinkedIn',
                    isDark: isDark,
                  ),
                  const SizedBox(width: LayoutConstrains.m1),
                  _SocialButton(
                    icon: FontAwesomeIcons.github,
                    url: SocialLinks.github,
                    label: 'GitHub',
                    isDark: isDark,
                  ),
                  const SizedBox(width: LayoutConstrains.m1),
                  _SocialButton(
                    icon: FontAwesomeIcons.box,
                    url: SocialLinks.pubdev,
                    label: 'pub.dev',
                    isDark: isDark,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactOptions(
    BuildContext context,
    bool isDark,
    bool isMobile,
  ) {
    return Column(
      children: [
        // Email button
        SizedBox(
          width: isMobile ? double.infinity : 300,
          child: ElevatedButton.icon(
            onPressed: () => _launchUrl(
              'mailto:${PersonalInfo.email}?subject=Hello%20Woroud%20-%20Job%20Opportunity',
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutConstrains.m3,
                vertical: LayoutConstrains.m1,
              ),
            ),
            icon: const Icon(Icons.mail_outline, size: 20),
            label: const Text('Send me an Email'),
          ),
        ),
        const SizedBox(height: LayoutConstrains.s3),

        // Or text
        Text(
          'or',
          style: AppTypo.bodySmall(context).copyWith(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: LayoutConstrains.s3),

        // WhatsApp/Phone button
        SizedBox(
          width: isMobile ? double.infinity : 300,
          child: OutlinedButton.icon(
            onPressed: () => _launchUrl(
              'https://wa.me/${PersonalInfo.phone.replaceAll('+', '')}',
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutConstrains.m3,
                vertical: LayoutConstrains.m1,
              ),
            ),
            icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18),
            label: const Text('Message on WhatsApp'),
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String label;
  final bool isDark;

  const _SocialButton({
    required this.icon,
    required this.url,
    required this.label,
    required this.isDark,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    if (widget.url.isEmpty) return;
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstrains.m1,
            vertical: LayoutConstrains.s3,
          ),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primaryPurple.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(PRadius.button),
          ),
          child: Column(
            children: [
              FaIcon(
                widget.icon,
                size: 24,
                color: _isHovered
                    ? AppColors.primaryCyan
                    : (widget.isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary),
              ),
              const SizedBox(height: LayoutConstrains.s1),
              Text(
                widget.label,
                style: AppTypo.labelSmall(context).copyWith(
                  color: _isHovered
                      ? AppColors.primaryCyan
                      : (widget.isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}