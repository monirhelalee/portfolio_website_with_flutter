import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LogoWidget(),
        const Spacer(),
        if (Responsive.isDesktop(context) || Responsive.isTablet(context))
          const RowMenuWidget(),
      ],
    );
  }
}
