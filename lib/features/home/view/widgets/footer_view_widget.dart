import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';

class FooterViewWidget extends StatelessWidget {
  const FooterViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
        color: AppColors.background,
      ),
      child: Center(
        child: Text(
          '© $year Md. Monir Haider Helalee. Built with Flutter.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textMuted,
              ),
        ),
      ),
    );
  }
}
