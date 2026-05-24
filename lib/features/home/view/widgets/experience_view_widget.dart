import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/model/experience_model.dart';

class ExperienceViewWidget extends StatelessWidget {
  const ExperienceViewWidget({super.key});

  static final _experiencesFuture = ExperienceRepository.loadExperiences();

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
        FutureBuilder<List<ExperienceItem>>(
          future: _experiencesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(24),
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Unable to load experience data.',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return BubbleTimeline(
              bubbleSize: Responsive.isMobile(context) ? 80 : 100,
              padding: const EdgeInsets.all(5),
              dotSize: Responsive.isMobile(context) ? 20 : 30,
              items: snapshot.data!
                  .map((item) => _buildTimelineItem(context, item))
                  .toList(),
              stripColor: Colors.tealAccent,
              dividerCircleColor: Colors.white,
              spaceBetweenItems: Responsive.isMobile(context) ? 40 : 20,
            );
          },
        ),
      ],
    );
  }

  TimelineItem _buildTimelineItem(BuildContext context, ExperienceItem item) {
    return TimelineItem(
      title: item.company,
      subtitle: item.role,
      icon: Icon(
        item.icon,
        color: Colors.black,
      ),
      bubbleColor: item.color,
      description: item.periodLabel,
      titleStyle: TextStyle(
        fontSize: Responsive.isMobile(context) ? 14 : 20,
        fontWeight: FontWeight.w700,
      ),
      subtitleStyle: TextStyle(
        fontSize: Responsive.isMobile(context) ? 12 : 16,
        fontWeight: FontWeight.w500,
      ),
      descriptionStyle: TextStyle(
        fontSize: Responsive.isMobile(context) ? 10 : 12,
      ),
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
