import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/colors.dart';

/// Animated floating orb/sphere decoration
class AnimatedOrb extends StatefulWidget {
  final double size;
  final List<Color>? colors;
  final Duration duration;
  final Offset offset;
  final double blur;

  const AnimatedOrb({
    super.key,
    this.size = 200,
    this.colors,
    this.duration = const Duration(seconds: 8),
    this.offset = Offset.zero,
    this.blur = 60,
  });

  @override
  State<AnimatedOrb> createState() => _AnimatedOrbState();
}

class _AnimatedOrbState extends State<AnimatedOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
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
        final value = _controller.value * 2 * math.pi;
        final dx = math.sin(value) * 20 + widget.offset.dx;
        final dy = math.cos(value) * 15 + widget.offset.dy;

        return Transform.translate(
          offset: Offset(dx, dy),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: widget.colors ?? AppColors.orbGradient1,
                center: Alignment.center,
                radius: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: (widget.colors?.first ?? AppColors.primaryPurple)
                      .withOpacity(0.4),
                  blurRadius: widget.blur,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Multiple orbs for background decoration
class OrbsBackground extends StatelessWidget {
  const OrbsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Large purple orb - top right
        const Positioned(
          top: -100,
          right: -100,
          child: AnimatedOrb(
            size: 400,
            colors: AppColors.orbGradient1,
            duration: Duration(seconds: 10),
          ),
        ),
        // Medium pink orb - bottom left
        Positioned(
          bottom: size.height * 0.2,
          left: -80,
          child: const AnimatedOrb(
            size: 250,
            colors: AppColors.orbGradient2,
            duration: Duration(seconds: 12),
            offset: Offset(10, 0),
          ),
        ),
        // Small cyan orb - center right
        Positioned(
          top: size.height * 0.4,
          right: size.width * 0.1,
          child: const AnimatedOrb(
            size: 150,
            colors: AppColors.orbGradient3,
            duration: Duration(seconds: 8),
            offset: Offset(-5, 10),
          ),
        ),
        // Extra small orb - top left
        Positioned(
          top: size.height * 0.15,
          left: size.width * 0.2,
          child: const AnimatedOrb(
            size: 100,
            colors: AppColors.orbGradient1,
            duration: Duration(seconds: 15),
            blur: 40,
          ),
        ),
      ],
    );
  }
}

/// Single floating circle decoration
class FloatingCircle extends StatefulWidget {
  final double size;
  final Color color;
  final bool filled;

  const FloatingCircle({
    super.key,
    this.size = 20,
    this.color = AppColors.primaryCyan,
    this.filled = false,
  });

  @override
  State<FloatingCircle> createState() => _FloatingCircleState();
}

class _FloatingCircleState extends State<FloatingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
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
        return Transform.translate(
          offset: Offset(0, _controller.value * 10 - 5),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.filled ? widget.color : null,
              border: widget.filled
                  ? null
                  : Border.all(color: widget.color, width: 2),
            ),
          ),
        );
      },
    );
  }
}