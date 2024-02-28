import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        _experience(context),
        const PillShapeUnderTitleWidget(),
        const SizedBox(
          height: 12,
        ),
        BubbleTimeline(
          bubbleSize: Responsive.isMobile(context) ? 80 : 100,
          padding: const EdgeInsets.all(5),
          dotSize: Responsive.isMobile(context) ? 20 : 30,
          items: [
            TimelineItem(
              title: 'WingsFin Limited',
              subtitle: 'Software Engineer (Flutter)',
              icon: const Icon(
                Icons.work,
                color: Colors.black,
              ),
              bubbleColor: Colors.green,
              description: 'September 2023 to present',
              titleStyle: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 14 : 20,
                  fontWeight: FontWeight.w700),
              subtitleStyle: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 12 : 16,
                  fontWeight: FontWeight.w500),
              descriptionStyle: TextStyle(
                fontSize: Responsive.isMobile(context) ? 10 : 12,
              ),
            ),
            TimelineItem(
              title: 'Nodes Digital Limited',
              subtitle: 'Software Engineer (Flutter)',
              icon: const Icon(
                Icons.work_history_rounded,
                color: Colors.black,
              ),
              bubbleColor: Colors.yellow,
              description: 'August 2022 to August 2023',
              titleStyle: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 14 : 20,
                  fontWeight: FontWeight.w700),
              subtitleStyle: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 12 : 16,
                  fontWeight: FontWeight.w500),
              descriptionStyle: TextStyle(
                fontSize: Responsive.isMobile(context) ? 10 : 12,
              ),
            ),
            TimelineItem(
              title: 'Ishraak Solutions Limited',
              subtitle: 'Junior Flutter Developer',
              icon: const Icon(
                Icons.work_history_rounded,
                color: Colors.black,
              ),
              bubbleColor: Colors.purple,
              description: 'December 2020 to June 2022',
              titleStyle: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 14 : 20,
                  fontWeight: FontWeight.w700),
              subtitleStyle: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 12 : 16,
                  fontWeight: FontWeight.w500),
              descriptionStyle: TextStyle(
                fontSize: Responsive.isMobile(context) ? 10 : 12,
              ),
            ),
            TimelineItem(
              title: 'East West University',
              subtitle:
                  'Teaching Assistant (Dept. of Electronics and Communications Engineering)',
              icon: const Icon(
                Icons.work_history_rounded,
                color: Colors.black,
              ),
              bubbleColor: Colors.blueAccent,
              description: 'May 2018 to April 2020',
              titleStyle: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 14 : 20.0,
                  fontWeight: FontWeight.w700),
              subtitleStyle: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 12 : 16,
                  fontWeight: FontWeight.w500),
              descriptionStyle: TextStyle(
                fontSize: Responsive.isMobile(context) ? 10 : 12,
              ),
            ),
          ],
          stripColor: Colors.tealAccent,
          dividerCircleColor: Colors.white,
          spaceBetweenItems: Responsive.isMobile(context) ? 40 : 20,
        ),
      ],
    );
  }

  Widget _experience(context) {
    return Text(
      'Experience',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 48,
            color: Colors.white,
          ),
    );
  }
}
