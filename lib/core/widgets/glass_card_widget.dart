import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/theme/app_colors.dart';

class GlassCardWidget extends StatefulWidget {
  const GlassCardWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 16,
    this.onTap,
  });

  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  State<GlassCardWidget> createState() => _GlassCardWidgetState();
}

class _GlassCardWidgetState extends State<GlassCardWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: widget.padding,
      decoration: BoxDecoration(
        color: _hovered ? AppColors.surfaceElevated : AppColors.surface,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: _hovered
              ? AppColors.accent.withValues(alpha: 0.4)
              : AppColors.border,
        ),
        boxShadow: _hovered
            ? [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: widget.child,
    );

    if (widget.onTap == null) {
      return MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: card,
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        hoverColor: Colors.transparent,
        child: card,
      ),
    );
  }
}
