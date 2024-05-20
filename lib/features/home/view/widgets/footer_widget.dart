import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blueGrey.shade900,
      child: const Center(
        child: Text('2024 © Copyright (Md. Monir Haider Helalee)'),
      ),
    );
  }
}
