import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({super.key});

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 105 + (28 * 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialIconWidget(
            onTap: () async {
              final uri = Uri(
                scheme: 'mailto',
                path: 'mdmonirhelale@gmail.com',
                queryParameters: {'subject': '', 'body': ''},
              );

              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                // Show an error message to the user
              }
            },
            name: 'email',
            isNetworkImage: true,
            url:
                'https://img.icons8.com/external-others-inmotus-design/67/external-Email-round-icons-others-inmotus-design.png',
          ),
          const SizedBox(
            width: 10,
          ),
          SocialIconWidget(
            onTap: () async {
              String facebookProfileLink =
                  'https://www.facebook.com/m.h.helalee';

              if (await canLaunchUrl(Uri.parse(facebookProfileLink))) {
                await launchUrl(Uri.parse(facebookProfileLink));
              } else {
                throw 'Could not launch $facebookProfileLink';
              }
            },
            name: 'facebook',
            isNetworkImage: true,
            url: 'https://img.icons8.com/fluency/96/facebook-circled.png',
          ),
          const SizedBox(
            width: 10,
          ),
          const SocialIconWidget(
            name: 'instagram',
            isNetworkImage: true,
            url: 'https://img.icons8.com/fluency/96/instagram-new.png',
          ),
          const SizedBox(
            width: 10,
          ),
          const SocialIconWidget(
            name: 'linkedin',
            isNetworkImage: true,
            url: 'https://img.icons8.com/fluency/96/linkedin.png',
          ),
          const SizedBox(
            width: 10,
          ),
          const SocialIconWidget(
            name: 'github',
            isNetworkImage: true,
            url: 'https://img.icons8.com/sf-black-filled/128/github.png',
          ),
          const SizedBox(
            width: 10,
          ),
          const SocialIconWidget(
            name: 'x',
            isNetworkImage: true,
            url: 'https://img.icons8.com/ios-glyphs/90/twitterx--v2.png',
          ),
          const SizedBox(
            width: 10,
          ),
          const SocialIconWidget(
            name: 'whatsapp',
            isNetworkImage: true,
            url: 'https://img.icons8.com/color/96/whatsapp--v1.png',
          ),
        ],
      ),
    );
  }
}
