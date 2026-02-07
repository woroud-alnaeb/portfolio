import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/const.dart';
import '../theme/typo.dart';
import 'gradient_text.dart';

/// Section title with gradient and subtitle
class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool useGradient;
  final TextAlign textAlign;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.useGradient = true,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (useGradient)
          GradientText(
            text: title,
            style: AppTypo.headlineLarge(context),
            textAlign: textAlign,
          )
        else
          Text(
            title,
            style: AppTypo.headlineLarge(context).copyWith(
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
            textAlign: textAlign,
          ),
        if (subtitle != null) ...[
          const SizedBox(height: LayoutConstrains.s3),
          Text(
            subtitle!,
            style: AppTypo.bodyLarge(context).copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
            textAlign: textAlign,
          ),
        ],
      ],
    );
  }
}

/// Section wrapper with consistent padding and max width
class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final String? sectionId;

  const SectionWrapper({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.sectionId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding:
          padding ??
          const EdgeInsets.symmetric(
            horizontal: LayoutConstrains.m3,
            vertical: LayoutConstrains.xl2,
          ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: MaxWidth.content),
          child: child,
        ),
      ),
    );
  }
}

/// Fade in animation wrapper when scrolled into view
class FadeInOnScroll extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Offset offset;

  const FadeInOnScroll({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.offset = const Offset(0, 30),
  });

  @override
  State<FadeInOnScroll> createState() => _FadeInOnScrollState();
}

class _FadeInOnScrollState extends State<FadeInOnScroll>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: _slideAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
