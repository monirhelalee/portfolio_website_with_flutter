import 'package:flutter/material.dart';

class PillShapeUnderTitleWidget extends StatelessWidget {
  const PillShapeUnderTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
