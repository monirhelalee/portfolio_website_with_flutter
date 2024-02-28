import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  double deskHeight = 80;
  double iconSizeDesk = 30;
  double titleSizeDesk = 10;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (v) {
        if (v) {
          deskHeight = 85;
          iconSizeDesk = 35;
          titleSizeDesk = 12;
        } else {
          deskHeight = 80;
          iconSizeDesk = 30;
          titleSizeDesk = 10;
        }
        setState(() {});
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        height: deskHeight,
        width: deskHeight,
        padding: const EdgeInsets.all(8),
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
                        height: iconSizeDesk,
                        width: iconSizeDesk,
                        fit: BoxFit.fill,
                      )
                    : SvgPicture.asset(
                        widget.iconPath,
                        height: iconSizeDesk,
                        width: iconSizeDesk,
                        fit: BoxFit.fill,
                      ))
                : Image.network(
                    widget.iconPath,
                    height: iconSizeDesk,
                    width: iconSizeDesk,
                    fit: BoxFit.fill,
                  ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: titleSizeDesk,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
