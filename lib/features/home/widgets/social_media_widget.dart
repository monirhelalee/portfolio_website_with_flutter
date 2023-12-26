import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _icon(name: 'email'),
        const SizedBox(
          width: 10,
        ),
        _icon(name: 'facebook'),
        const SizedBox(
          width: 10,
        ),
        _icon(name: 'instagram'),
        const SizedBox(
          width: 10,
        ),
        _icon(name: 'linkedin'),
        const SizedBox(
          width: 10,
        ),
        _icon(name: 'github'),
        const SizedBox(
          width: 10,
        ),
        _icon(name: 'x'),
        const SizedBox(
          width: 10,
        ),
        _icon(name: 'whatsapp'),
      ],
    );
  }

  Widget _icon({required String name}) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          'assets/$name.png',
          height: 28,
          width: 28,
        ),
      ),
    );
  }
}
