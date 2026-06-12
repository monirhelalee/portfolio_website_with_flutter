import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/skills_widget.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/social_media_widget.dart';

class AboutViewWidget extends StatelessWidget {
  const AboutViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final padding = AppSpacing.sectionPadding(width);
    final isWide = Responsive.isDesktop(context) || Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: AppSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AppSpacing.contentMaxWidth(width)),
          child: Column(
            children: [
              SectionHeaderWidget(
                title: 'About Me',
                subtitle: Constant.aboutMeShort,
              ),
              const SizedBox(height: AppSpacing.xl),
              if (isWide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _aboutColumn(context)),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(child: _skillsColumn(context)),
                  ],
                )
              else ...[
                _aboutColumn(context),
                const SizedBox(height: AppSpacing.lg),
                _skillsColumn(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _aboutColumn(BuildContext context) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get to know me',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            Constant.aboutMeLong,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Feel free to connect or follow',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.textMuted,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const SocialMediaWidget(),
        ],
      ),
    );
  }

  Widget _skillsColumn(BuildContext context) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Skills',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          const SkillsWidget(),
        ],
      ),
    );
  }
}
