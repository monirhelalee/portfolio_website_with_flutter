import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/model/project_model.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';

class ProjectViewWidget extends StatelessWidget {
  const ProjectViewWidget({super.key});

  static final _projectsFuture = ProjectRepository.loadProjects();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final padding = AppSpacing.sectionPadding(width);

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
              const SectionHeaderWidget(
                title: 'Projects',
                subtitle:
                    'Mobile and web apps I have helped build and ship to production.',
              ),
              const SizedBox(height: AppSpacing.lg),
              FutureBuilder<List<ProjectItem>>(
                future: _projectsFuture,
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
                      'Unable to load projects.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }

                  return _ProjectGrid(projects: snapshot.data!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid({required this.projects});

  final List<ProjectItem> projects;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: projects
          .map((project) => ProjectCartWidget(project: project))
          .toList(),
    );
  }
}
