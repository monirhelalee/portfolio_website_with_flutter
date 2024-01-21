import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

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
                      _contactButton(),
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
                      _contactButton(),
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
    return Text(
      'Hello World!',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 28,
            color: Colors.white,
          ),
    );
  }

  Widget _name(context) {
    return const Row(
      children: [
        Text(
          "I'm ",
          style: TextStyle(
            fontSize: 38,
            color: Colors.white,
          ),
        ),
        Text(
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
    return Text(
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

  Widget _contactButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Text("Contact"),
      ),
    );
  }
}
