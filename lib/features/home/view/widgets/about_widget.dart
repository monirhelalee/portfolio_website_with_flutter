import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';
import 'package:my_portfolio_flutter/features/home/view_model/home_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var homeVM = HomeViewModel.read(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    _aboutMe(context, homeVM),
                    const SizedBox(
                      height: 24,
                    ),
                    const SocialMediaWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    _resumeDownloadButton(),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Text(
                    Constant.about,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _aboutMe(context, homeVM),
                    const SizedBox(
                      height: 24,
                    ),
                    const SocialMediaWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    _resumeDownloadButton(),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    'Nunc ut lectus elementum, euismod quam quis, finibus dui. Vestibulum commodo eleifend accumsan. Duis eu diam dignissim, cursus risus imperdiet, mattis nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam egestas tristique risus eget sodales. Sed eu magna a sem dictum suscipit et in dui. Donec maximus odio sit amet dolor facilisis, eget fermentum dui aliquam. Pellentesque tristique neque ut dignissim aliquet. Maecenas augue purus, pharetra et leo eu, tristique ultricies justo. Fusce feugiat arcu vel quam feugiat, aliquam finibus mi convallis. Suspendisse sagittis tincidunt faucibus. Vivamus tincidunt dignissim tortor, quis convallis leo finibus at. Aliquam erat volutpat.',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _aboutMe(context, homeVM) {
    return Text(
      'About Me',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 48,
            color: Colors.white,
          ),
    );
  }

  Widget _resumeDownloadButton() {
    return ElevatedButton(
      onPressed: () async {
        String resumeLink =
            'https://drive.google.com/file/d/1XmZlZuCxG7amVAXLAYQZTQFHebCH1l2X/view?usp=sharing';

        if (await canLaunchUrl(Uri.parse(resumeLink))) {
          await launchUrl(Uri.parse(resumeLink));
        } else {
          throw 'Could not launch $resumeLink';
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Text("Download Resume"),
      ),
    );
  }
}
