import 'package:flutter/material.dart';

class RowMenuWidget extends StatelessWidget {
  const RowMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Home',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          'About Me',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          'Experience',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          'Projects',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          'Skills',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          'Contact',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
