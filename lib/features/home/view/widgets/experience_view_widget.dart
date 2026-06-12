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
    final width = MediaQuery.sizeOf(context).width;
    final padding = AppSpacing.sectionPadding(width);

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: AppSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AppSpacing.contentMaxWidth(width)),
          child: Column(
            children: [
              const SectionHeaderWidget(
                title: 'Experience',
                subtitle: 'A timeline of companies and roles I have worked with.',
              ),
              const SizedBox(height: AppSpacing.lg),
              FutureBuilder<List<ExperienceItem>>(
                future: _experiencesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.all(AppSpacing.md),
                      child: CircularProgressIndicator(
                        color: AppColors.accent,
                      ),
                    );
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return Text(
                      'Unable to load experience data.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }

                  return BubbleTimeline(
                    bubbleSize: Responsive.isMobile(context) ? 80 : 100,
                    padding: const EdgeInsets.all(5),
                    dotSize: Responsive.isMobile(context) ? 20 : 30,
                    items: snapshot.data!
                        .map((item) => _buildTimelineItem(context, item))
                        .toList(),
                    stripColor: AppColors.accent,
                    dividerCircleColor: AppColors.textPrimary,
                    spaceBetweenItems: Responsive.isMobile(context) ? 40 : 20,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TimelineItem _buildTimelineItem(BuildContext context, ExperienceItem item) {
    return TimelineItem(
      title: item.company,
      subtitle: item.role,
      icon: Icon(item.icon, color: AppColors.background),
      bubbleColor: item.color,
      description: item.periodLabel,
      titleStyle: TextStyle(
        fontSize: Responsive.isMobile(context) ? 14 : 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      subtitleStyle: TextStyle(
        fontSize: Responsive.isMobile(context) ? 12 : 15,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      ),
      descriptionStyle: TextStyle(
        fontSize: Responsive.isMobile(context) ? 10 : 12,
        color: AppColors.textMuted,
      ),
    );
  }
}
