import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';
import 'package:scroll_pos/scroll_pos.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.controller,
    required this.onMenuTap,
  });

  final ScrollPosController controller;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          LogoWidget(controller: controller),
          const Spacer(),
          if (Responsive.isDesktop(context) || Responsive.isTablet(context))
            RowMenuWidget(controller: controller)
          else
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
            ),
        ],
      ),
    );
  }
}
