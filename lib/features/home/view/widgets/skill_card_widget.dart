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
  });

  final String iconPath;
  final String title;
  final bool isSvg;
  final bool isLink;

  @override
  State<SkillCartWidget> createState() => _SkillCartWidgetState();
}

class _SkillCartWidgetState extends State<SkillCartWidget> {
  double mobileHeight = 90;
  double deskHeight = 150;
  double iconSizeMobile = 35;
  double iconSizeDesk = 65;
  double titleSizeMobile = 10;
  double titleSizeDesk = 14;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (v) {
        if (v) {
          mobileHeight = 100;
          deskHeight = 160;
          iconSizeMobile = 35;
          iconSizeDesk = 65;
          titleSizeMobile = 12;
          titleSizeDesk = 16;
        } else {
          mobileHeight = 90;
          deskHeight = 150;
          iconSizeMobile = 30;
          iconSizeDesk = 60;
          titleSizeMobile = 10;
          titleSizeDesk = 14;
        }
        setState(() {});
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        height: Responsive.isMobile(context) ? mobileHeight : deskHeight,
        width: Responsive.isMobile(context) ? mobileHeight : deskHeight,
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 12 : 18),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(milliseconds: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.isSvg
                ? (widget.isLink
                    ? SvgPicture.network(
                        widget.iconPath,
                        height: Responsive.isMobile(context)
                            ? iconSizeMobile
                            : iconSizeDesk,
                        width: Responsive.isMobile(context)
                            ? iconSizeMobile
                            : iconSizeDesk,
                        fit: BoxFit.fill,
                      )
                    : SvgPicture.asset(
                        widget.iconPath,
                        height: Responsive.isMobile(context)
                            ? iconSizeMobile
                            : iconSizeDesk,
                        width: Responsive.isMobile(context)
                            ? iconSizeMobile
                            : iconSizeDesk,
                        fit: BoxFit.fill,
                      ))
                : Image.network(
                    widget.iconPath,
                    height: Responsive.isMobile(context)
                        ? iconSizeMobile
                        : iconSizeDesk,
                    width: Responsive.isMobile(context)
                        ? iconSizeMobile
                        : iconSizeDesk,
                    fit: BoxFit.fill,
                  ),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: Responsive.isMobile(context)
                        ? titleSizeMobile
                        : titleSizeDesk,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}