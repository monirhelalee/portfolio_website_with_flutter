import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';

class SkillCartWidget extends StatelessWidget {
  const SkillCartWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.isSvg = true,
    this.isLink = true,
  });

  final String iconPath;
  final String title;
  final bool isSvg;
  final bool isLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context) ? 90 : 150,
      width: Responsive.isMobile(context) ? 90 : 150,
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 12 : 20),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isLink)
            SvgPicture.network(
              iconPath,
              height: Responsive.isMobile(context) ? 30 : 60,
              width: Responsive.isMobile(context) ? 30 : 60,
              fit: BoxFit.cover,
            )
          else
            SvgPicture.asset(
              iconPath,
              height: Responsive.isMobile(context) ? 30 : 60,
              width: Responsive.isMobile(context) ? 30 : 60,
              fit: BoxFit.cover,
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: Responsive.isMobile(context) ? 10 : 16,
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
