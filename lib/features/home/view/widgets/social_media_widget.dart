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
        mainAxisAlignment: MainAxisAlignment.start,
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
          SocialIconWidget(
            onTap: () async {
              String instagramProfileLink =
                  'https://www.instagram.com/m.h.helalee/';

              if (await canLaunchUrl(Uri.parse(instagramProfileLink))) {
                await launchUrl(Uri.parse(instagramProfileLink));
              } else {
                throw 'Could not launch $instagramProfileLink';
              }
            },
            name: 'instagram',
            isNetworkImage: true,
            url: 'https://img.icons8.com/fluency/96/instagram-new.png',
          ),
          const SizedBox(
            width: 10,
          ),
          SocialIconWidget(
            onTap: () async {
              String linkedinProfileLink =
                  'https://www.linkedin.com/in/helalee/';

              if (await canLaunchUrl(Uri.parse(linkedinProfileLink))) {
                await launchUrl(Uri.parse(linkedinProfileLink));
              } else {
                throw 'Could not launch $linkedinProfileLink';
              }
            },
            name: 'linkedin',
            isNetworkImage: true,
            url: 'https://img.icons8.com/fluency/96/linkedin.png',
          ),
          const SizedBox(
            width: 10,
          ),
          SocialIconWidget(
            onTap: () async {
              String githubProfileLink = 'https://github.com/monirhelalee';

              if (await canLaunchUrl(Uri.parse(githubProfileLink))) {
                await launchUrl(Uri.parse(githubProfileLink));
              } else {
                throw 'Could not launch $githubProfileLink';
              }
            },
            name: 'github',
            isNetworkImage: true,
            url: 'https://img.icons8.com/sf-black-filled/128/github.png',
          ),
          const SizedBox(
            width: 10,
          ),
          SocialIconWidget(
            onTap: () async {
              String xProfileLink = 'https://twitter.com/MonirHelale';

              if (await canLaunchUrl(Uri.parse(xProfileLink))) {
                await launchUrl(Uri.parse(xProfileLink));
              } else {
                throw 'Could not launch $xProfileLink';
              }
            },
            name: 'x',
            isNetworkImage: true,
            url: 'https://img.icons8.com/ios-glyphs/90/twitterx--v2.png',
          ),
          const SizedBox(
            width: 10,
          ),
          SocialIconWidget(
            onTap: () async {
              var contact = "+8801786416417";
              var whatsappUrl = "https://wa.me/$contact";
              if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                await launchUrl(Uri.parse(whatsappUrl));
              } else {
                throw 'Could not launch $whatsappUrl';
              }
            },
            name: 'whatsapp',
            isNetworkImage: true,
            url: 'https://img.icons8.com/color/96/whatsapp--v1.png',
          ),
        ],
      ),
    );
  }
}
