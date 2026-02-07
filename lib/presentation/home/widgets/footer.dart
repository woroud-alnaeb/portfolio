import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/design/design.dart';
import '../../../data/portfolio_data.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstrains.m3,
        vertical: LayoutConstrains.l1,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: MaxWidth.content),
          child: Column(
            children: [
              // Social links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    url: SocialLinks.linkedin,
                    isDark: isDark,
                  ),
                  const SizedBox(width: LayoutConstrains.m2),
                  _SocialButton(
                    icon: FontAwesomeIcons.github,
                    url: SocialLinks.github,
                    isDark: isDark,
                  ),
                  const SizedBox(width: LayoutConstrains.m2),
                  _SocialButton(
                    icon: FontAwesomeIcons.box,
                    url: SocialLinks.pubdev,
                    isDark: isDark,
                  ),
                ],
              ),
              const SizedBox(height: LayoutConstrains.m3),
              // Copyright
              Text(
                '© $year ${PersonalInfo.name}. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: LayoutConstrains.s2),
              Text(
                'Built with Flutter 💙',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? AppColors.darkTextSecondary.withOpacity(0.7)
                      : AppColors.lightTextSecondary.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final bool isDark;

  const _SocialButton({
    required this.icon,
    required this.url,
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
          padding: const EdgeInsets.all(LayoutConstrains.s3),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primaryPurple.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(PRadius.button),
          ),
          child: FaIcon(
            widget.icon,
            size: 20,
            color: _isHovered
                ? AppColors.primaryCyan
                : (widget.isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary),
          ),
        ),
      ),
    );
  }
}
