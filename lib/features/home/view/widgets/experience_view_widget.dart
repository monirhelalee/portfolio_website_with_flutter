import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';

class ExperienceViewWidget extends StatelessWidget {
  const ExperienceViewWidget({super.key});

  static const _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static String _experiencePeriod({
    required int startYear,
    required int startMonth,
    int? endYear,
    int? endMonth,
    bool isPresent = false,
  }) {
    final startLabel = '${_monthNames[startMonth - 1]} $startYear';
    final endLabel =
        isPresent ? 'present' : '${_monthNames[endMonth! - 1]} $endYear';

    final effectiveEndYear = isPresent ? DateTime.now().year : endYear!;
    final effectiveEndMonth = isPresent ? DateTime.now().month : endMonth!;

    final duration = _formatMonths(
      _monthsBetween(
        startYear,
        startMonth,
        effectiveEndYear,
        effectiveEndMonth,
      ),
    );

    return '$startLabel to $endLabel $duration';
  }

  static int _monthsBetween(
    int startYear,
    int startMonth,
    int endYear,
    int endMonth,
  ) {
    return (endYear - startYear) * 12 + (endMonth - startMonth);
  }

  static String _formatMonths(int totalMonths) {
    if (totalMonths <= 0) {
      return '(0 months)';
    }

    final years = totalMonths ~/ 12;
    final months = totalMonths % 12;
    final parts = <String>[];

    if (years > 0) {
      parts.add('$years ${years == 1 ? 'year' : 'years'}');
    }
    if (months > 0) {
      parts.add('$months ${months == 1 ? 'month' : 'months'}');
    }

    return '(${parts.join(' ')})';
  }

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
              subtitle: 'Senior Software Engineer (Flutter)',
              icon: const Icon(
                Icons.work,
                color: Colors.black,
              ),
              bubbleColor: Colors.green,
              description: _experiencePeriod(
                startYear: 2026,
                startMonth: 1,
                isPresent: true,
              ),
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
              title: 'WingsFin Limited',
              subtitle: 'Software Engineer (Flutter)',
              icon: const Icon(
                Icons.work_history_rounded,
                color: Colors.black,
              ),
              bubbleColor: Colors.lightGreen,
              description: _experiencePeriod(
                startYear: 2023,
                startMonth: 9,
                endYear: 2026,
                endMonth: 1,
              ),
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
              description: _experiencePeriod(
                startYear: 2022,
                startMonth: 8,
                endYear: 2023,
                endMonth: 8,
              ),
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
              description: _experiencePeriod(
                startYear: 2020,
                startMonth: 12,
                endYear: 2022,
                endMonth: 6,
              ),
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
              subtitle: 'Teaching Assistant (Dept. of ECE)',
              icon: const Icon(
                Icons.work_history_rounded,
                color: Colors.black,
              ),
              bubbleColor: Colors.blueAccent,
              description: _experiencePeriod(
                startYear: 2018,
                startMonth: 5,
                endYear: 2020,
                endMonth: 4,
              ),
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
