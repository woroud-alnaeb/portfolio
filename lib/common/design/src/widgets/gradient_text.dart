import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/gradients.dart';

/// Text widget with gradient effect
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient? gradient;
  final TextAlign? textAlign;

  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.gradient,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => (gradient ?? AppGradients.textGradient)
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: style, textAlign: textAlign),
    );
  }
}

/// Animated typing text effect
class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final VoidCallback? onComplete;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 100),
    this.onComplete,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayText = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() async {
    for (int i = 0; i < widget.text.length; i++) {
      await Future.delayed(widget.duration);
      if (mounted) {
        setState(() {
          _currentIndex = i + 1;
          _displayText = widget.text.substring(0, _currentIndex);
        });
      }
    }
    widget.onComplete?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_displayText, style: widget.style),
        AnimatedOpacity(
          opacity: _currentIndex < widget.text.length ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 3,
            height: (widget.style?.fontSize ?? 16) * 1.2,
            margin: const EdgeInsets.only(left: 2),
            decoration: BoxDecoration(
              color: AppColors.primaryCyan,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}

/// Animated blinking cursor
class BlinkingCursor extends StatefulWidget {
  final double height;
  final Color? color;

  const BlinkingCursor({super.key, this.height = 24, this.color});

  @override
  State<BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
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
        return Opacity(
          opacity: _controller.value,
          child: Container(
            width: 3,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.color ?? AppColors.primaryCyan,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      },
    );
  }
}
