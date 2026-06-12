import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.onSectionTap});

  final VoidCallback onSectionTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSectionTap,
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
