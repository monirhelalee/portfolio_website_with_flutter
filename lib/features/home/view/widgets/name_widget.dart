import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.code,
          size: 24,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Monir',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 24,
                color: Colors.white,
              ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Haider Helaee',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 24,
                color: Colors.white70,
              ),
        ),
      ],
    );
  }
}
