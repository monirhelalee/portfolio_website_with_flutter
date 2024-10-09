import 'package:flutter/material.dart';
import 'package:scroll_pos/scroll_pos.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.controller});
  final ScrollPosController controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.scrollToStart(animate: true);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        child: Row(
          children: [
            Image.asset(
              'assets/my_logo.png',
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}
