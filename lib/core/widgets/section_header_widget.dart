import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/theme/app_colors.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => AppColors.accentGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            title,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontSize: 42,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 4,
          width: 56,
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
