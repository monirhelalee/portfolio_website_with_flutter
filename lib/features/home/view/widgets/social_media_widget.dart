import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _SocialLink(
          onTap: () => _launch(Uri(
            scheme: 'mailto',
            path: 'mdmonirhelale@gmail.com',
          )),
          iconUrl:
              'https://img.icons8.com/external-others-inmotus-design/67/external-Email-round-icons-others-inmotus-design.png',
        ),
        _SocialLink(
          onTap: () => _launch(Uri.parse('https://www.facebook.com/m.h.helalee')),
          iconUrl: 'https://img.icons8.com/fluency/96/facebook-circled.png',
        ),
        _SocialLink(
          onTap: () =>
              _launch(Uri.parse('https://www.instagram.com/m.h.helalee/')),
          iconUrl: 'https://img.icons8.com/fluency/96/instagram-new.png',
        ),
        _SocialLink(
          onTap: () =>
              _launch(Uri.parse('https://www.linkedin.com/in/helalee/')),
          iconUrl: 'https://img.icons8.com/fluency/96/linkedin.png',
        ),
        _SocialLink(
          onTap: () =>
              _launch(Uri.parse('https://github.com/monirhelalee')),
          iconUrl: 'https://img.icons8.com/sf-black-filled/128/github.png',
        ),
        _SocialLink(
          onTap: () =>
              _launch(Uri.parse('https://twitter.com/MonirHelale')),
          iconUrl: 'https://img.icons8.com/ios-glyphs/90/twitterx--v2.png',
        ),
        _SocialLink(
          onTap: () => _launch(Uri.parse('https://wa.me/+8801786416417')),
          iconUrl: 'https://img.icons8.com/color/96/whatsapp--v1.png',
        ),
      ],
    );
  }

  Future<void> _launch(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _SocialLink extends StatefulWidget {
  const _SocialLink({required this.onTap, required this.iconUrl});

  final VoidCallback onTap;
  final String iconUrl;

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.1)
                : AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered ? AppColors.accent.withValues(alpha: 0.3) : AppColors.border,
            ),
          ),
          child: Image.network(widget.iconUrl, width: 28, height: 28),
        ),
      ),
    );
  }
}
