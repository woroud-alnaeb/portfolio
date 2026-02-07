import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../theme/colors.dart';
import '../theme/const.dart';

/// Animated skill progress bar
class SkillBar extends StatefulWidget {
  final String name;
  final int level; // 0-100
  final String? years;
  final Color? color;
  final bool animate;

  const SkillBar({
    super.key,
    required this.name,
    required this.level,
    this.years,
    this.color,
    this.animate = true,
  });

  @override
  State<SkillBar> createState() => _SkillBarState();
}

class _SkillBarState extends State<SkillBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.level / 100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    if (!widget.animate) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.3 && !_hasAnimated && widget.animate) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final barColor = widget.color ?? AppColors.primaryPurple;

    return VisibilityDetector(
      key: Key('skill-${widget.name}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                  ),
                ),
              ),
              if (widget.years != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstrains.s2,
                    vertical: LayoutConstrains.s1,
                  ),
                  decoration: BoxDecoration(
                    color: barColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(PRadius.chip),
                  ),
                  child: Text(
                    '${widget.years} yrs',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: barColor,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: LayoutConstrains.s2),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  // Background bar
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkDivider
                          : AppColors.lightDivider,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  // Progress bar
                  FractionallySizedBox(
                    widthFactor: _animation.value,
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [barColor, barColor.withOpacity(0.7)],
                        ),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: barColor.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Compact skill chip
class SkillChip extends StatelessWidget {
  final String name;
  final Color? color;

  const SkillChip({super.key, required this.name, this.color});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Use brighter color in dark mode for better visibility
    final chipColor =
        color ?? (isDark ? AppColors.chipPurple : AppColors.primaryPurple);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstrains.m1,
        vertical: LayoutConstrains.s2,
      ),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(PRadius.chip),
        border: Border.all(color: chipColor.withOpacity(0.4)),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: chipColor,
        ),
      ),
    );
  }
}
