import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';

class SkillCartWidget extends StatefulWidget {
  const SkillCartWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.isSvg = true,
    this.isLink = true,
    this.isAsset = false,
  });

  final String iconPath;
  final String title;
  final bool isSvg;
  final bool isLink;
  final bool isAsset;

  @override
  State<SkillCartWidget> createState() => _SkillCartWidgetState();
}

class _SkillCartWidgetState extends State<SkillCartWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 88,
        width: 88,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.accent.withValues(alpha: 0.08)
              : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.35)
                : AppColors.border,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(32),
            const SizedBox(height: 6),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(double size) {
    if (widget.isAsset) {
      return Image.asset(
        widget.iconPath,
        height: size,
        width: size,
        fit: BoxFit.contain,
      );
    }

    if (widget.isSvg) {
      return widget.isLink
          ? SvgPicture.network(widget.iconPath, height: size, width: size)
          : SvgPicture.asset(widget.iconPath, height: size, width: size);
    }

    return Image.network(
      widget.iconPath,
      height: size,
      width: size,
      fit: BoxFit.contain,
    );
  }
}
