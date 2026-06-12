import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/model/project_model.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/project_card_widget.dart';

void showProjectDetail(BuildContext context, ProjectItem project) {
  if (Responsive.isMobile(context)) {
    _showBottomSheet(context, project);
  } else {
    _showDialog(context, project);
  }
}

void _showBottomSheet(BuildContext context, ProjectItem project) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      builder: (_, scrollController) => _ProjectDetailContent(
        project: project,
        scrollController: scrollController,
      ),
    ),
  );
}

void _showDialog(BuildContext context, ProjectItem project) {
  showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: project.screenshots.isNotEmpty ? 720 : 560,
          maxHeight: 720,
        ),
        child: GlassCardWidget(
          padding: EdgeInsets.zero,
          borderRadius: 20,
          child: _ProjectDetailContent(project: project),
        ),
      ),
    ),
  );
}

class _ProjectDetailContent extends StatelessWidget {
  const _ProjectDetailContent({
    required this.project,
    this.scrollController,
  });

  final ProjectItem project;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (scrollController != null) _buildDragHandle(),
          _buildHeader(context),
          if (project.category != null) ...[
            const SizedBox(height: AppSpacing.sm),
            _CategoryChip(label: project.category!),
          ],
          if (project.description != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              project.description!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
          if (project.contribution != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              'My Contribution',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              project.contribution!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textPrimary,
                  ),
            ),
          ],
          if (project.features.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              'Key Features',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            ...project.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, right: 10),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: AppColors.accent,
                      ),
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: feature.title,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(text: ' — ${feature.description}'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (project.screenshots.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              'Screenshots',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            _ProjectScreenshotsGallery(screenshots: project.screenshots),
          ],
          if (project.highlights.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              project.highlightsTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            ...project.highlights.map(
              (highlight) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, right: 10),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: AppColors.accent,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        highlight,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (project.tags.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.tags
                  .map((tag) => _TagChip(label: tag))
                  .toList(),
            ),
          ],
          if (project.hasStoreLinks) ...[
            const SizedBox(height: AppSpacing.lg),
            ProjectStoreButtons(project: project, iconSize: 32),
          ],
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectIcon(project: project, size: 56),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (project.featured)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    'Featured',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.photoYellow,
                          fontSize: 12,
                        ),
                  ),
                ),
              Text(
                project.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 22,
                    ),
              ),
              if (project.shortDescription != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    project.shortDescription!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                ),
            ],
          ),
        ),
        if (scrollController == null)
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close_rounded, color: AppColors.textMuted),
          ),
      ],
    );
  }
}

class _ProjectScreenshotsGallery extends StatelessWidget {
  const _ProjectScreenshotsGallery({required this.screenshots});

  final List<ProjectScreenshot> screenshots;

  static const _imageWidth = 160.0;
  static const _imageAspectRatio = 333 / 592;

  @override
  Widget build(BuildContext context) {
    final imageHeight = _imageWidth / _imageAspectRatio;

    return SizedBox(
      height: imageHeight + 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: screenshots.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final screenshot = screenshots[index];
          return SizedBox(
            width: _imageWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: _imageAspectRatio,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                      color: AppColors.background,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Image.asset(
                        screenshot.imagePath,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  screenshot.caption,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.3,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.accent,
              fontSize: 12,
            ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
      ),
    );
  }
}
