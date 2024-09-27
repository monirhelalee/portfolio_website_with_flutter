import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 64,
          right: 24,
          top: 24,
        ),
        child: Responsive.isDesktop(context) || Responsive.isTablet(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _helloWorld(context),
                      _name(context),
                      _flutterDev(context),
                      const SizedBox(
                        height: 24,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      _resumeDownloadButton(),
                    ],
                  ),
                  _animatedImage(context),
                ],
              )
            : Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _helloWorld(context),
                      _name(context),
                      _flutterDev(context),
                      const SizedBox(
                        height: 24,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      _resumeDownloadButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _animatedImage(context),
                ],
              ),
      ),
    );
  }

  Widget _helloWorld(context) {
    return AnimatedTextKit(
      isRepeatingAnimation: true,
      totalRepeatCount: 1000,
      animatedTexts: [
        TyperAnimatedText(
          'Hello World! 🌍',
          speed: const Duration(
            milliseconds: 100,
          ),
          textStyle: const TextStyle(
            fontSize: 28.0,
          ),
        ),
      ],
    );
  }

  Widget _name(context) {
    return const Row(
      children: [
        SelectableText(
          "I'm ",
          style: TextStyle(
            fontSize: 38,
            color: Colors.white,
          ),
        ),
        SelectableText(
          "Monir Haider",
          style: TextStyle(
            fontSize: 38,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _flutterDev(context) {
    return SelectableText(
      "Software Engineer",
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 28,
            color: Colors.white,
          ),
    );
  }

  Widget _animatedImage(context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (Responsive.isMobile(context))
          Lottie.asset(
            'assets/image_background.json',
            fit: BoxFit.fitWidth,
          )
        else
          Lottie.asset(
            'assets/image_background.json',
            height: 400,
          ),
        Image.asset(
          'assets/my2.png',
          height: 500,
          fit: BoxFit.fitHeight,
          // height: 500,
        ),
      ],
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
