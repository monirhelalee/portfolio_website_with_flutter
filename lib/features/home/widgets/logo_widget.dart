import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        child: Row(
          children: [
            const Icon(
              Icons.code,
              size: 24,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'MH',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
