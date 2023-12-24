import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/responsive.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Responsive.isDesktop(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello World!',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 38,
                                color: Colors.white,
                              ),
                    ),
                    Text(
                      "I'm Monir Haider Helalee",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 58,
                                color: Colors.white,
                              ),
                    ),
                    Text(
                      "Flutter Developer",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 38,
                                color: Colors.white,
                              ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Lottie.asset('assets/image_background.json', height: 500),
                    Image.asset('assets/my.png'),
                  ],
                ),
              ],
            )
          : Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello World!',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 38,
                                color: Colors.white,
                              ),
                    ),
                    Text(
                      "I'm Monir Haider Helalee",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 58,
                                color: Colors.white,
                              ),
                    ),
                    Text(
                      "Flutter Developer",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 38,
                                color: Colors.white,
                              ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Lottie.asset('assets/image_background.json', height: 500),
                    Image.asset('assets/my.png'),
                  ],
                ),
              ],
            ),
    );
  }
}
