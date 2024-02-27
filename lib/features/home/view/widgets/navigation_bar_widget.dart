import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';
import 'package:scroll_pos/scroll_pos.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key, required this.controller});

  final ScrollPosController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LogoWidget(
          controller: controller,
        ),
        const Spacer(),
        if (Responsive.isDesktop(context) || Responsive.isTablet(context))
          RowMenuWidget(
            controller: controller,
          ),
      ],
    );
  }
}
