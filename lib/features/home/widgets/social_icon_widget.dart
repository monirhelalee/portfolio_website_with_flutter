import 'package:flutter/material.dart';

class SocialIconWidget extends StatefulWidget {
  const SocialIconWidget({super.key, required this.name});
  final String name;

  @override
  State<SocialIconWidget> createState() => _SocialIconWidgetState();
}

class _SocialIconWidgetState extends State<SocialIconWidget> {
  double iconSize = 28;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (v) {
        if (v) {
          iconSize = 40;
        } else {
          iconSize = 28;
        }
        setState(() {});
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        height: iconSize + 2,
        width: iconSize + 2,
        padding: const EdgeInsets.all(2),
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          'assets/${widget.name}.png',
          height: iconSize,
          width: iconSize,
        ),
      ),
    );
    ;
  }
}
