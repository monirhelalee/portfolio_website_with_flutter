import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/features/home/widgets/exports.dart';

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({super.key});

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialIconWidget(name: 'email'),
          SizedBox(
            width: 10,
          ),
          SocialIconWidget(name: 'facebook'),
          SizedBox(
            width: 10,
          ),
          SocialIconWidget(name: 'instagram'),
          SizedBox(
            width: 10,
          ),
          SocialIconWidget(name: 'linkedin'),
          SizedBox(
            width: 10,
          ),
          SocialIconWidget(name: 'github'),
          SizedBox(
            width: 10,
          ),
          SocialIconWidget(name: 'x'),
          SizedBox(
            width: 10,
          ),
          SocialIconWidget(name: 'whatsapp'),
        ],
      ),
    );
  }
}
