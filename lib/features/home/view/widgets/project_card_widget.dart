import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/model/project_model.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/project_detail_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCartWidget extends StatefulWidget {
  const ProjectCartWidget({
    super.key,
    required this.project,
  });

  final ProjectItem project;

  @override
  State<ProjectCartWidget> createState() => _ProjectCartWidgetState();
}

class _ProjectCartWidgetState extends State<ProjectCartWidget> {
  bool _hovered = false;

  ProjectItem get project => widget.project;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: project.hasDetails
            ? () => showProjectDetail(context, project)
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 220,
          width: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.surfaceElevated : AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.4)
                  : AppColors.border,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProjectIcon(project: project, size: 72),
                  const SizedBox(height: 12),
                  Text(
                    project.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                  ),
                  const Spacer(),
                  if (project.hasStoreLinks)
                    GestureDetector(
                      onTap: () {},
                      child: ProjectStoreButtons(project: project),
                    ),
                ],
              ),
              if (project.hasDetails)
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _hovered ? 1 : 0,
                    child: IgnorePointer(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.background.withValues(alpha: 0.92),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.accent.withValues(alpha: 0.45),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          'Tap for details',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                color: AppColors.accent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectIcon extends StatelessWidget {
  const ProjectIcon({
    super.key,
    required this.project,
    required this.size,
  });

  final ProjectItem project;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (project.isAsset) {
      if (project.isSvg) {
        return SvgPicture.asset(
          project.iconPath,
          height: size,
          width: size,
        );
      }
      return Image.asset(
        project.iconPath,
        height: size,
        width: size,
        fit: BoxFit.contain,
      );
    }

    if (project.isSvg) {
      return project.isLink
          ? SvgPicture.network(
              project.iconPath,
              height: size,
              width: size,
            )
          : SvgPicture.asset(
              project.iconPath,
              height: size,
              width: size,
            );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        project.iconPath,
        height: size,
        width: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Icon(
          Icons.apps_rounded,
          size: size * 0.6,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}

class ProjectStoreButtons extends StatelessWidget {
  const ProjectStoreButtons({
    super.key,
    required this.project,
    this.iconSize = 26,
  });

  final ProjectItem project;
  final double iconSize;

  static const _playStoreIcon =
      'https://img.icons8.com/fluency/96/google-play-store-new.png';
  static const _appStoreIcon =
      'https://img.icons8.com/fluency/144/apple-app-store.png';
  static const _apkIcon =
      'https://img.icons8.com/external-bearicons-outline-color-bearicons/64/external-APK-file-extension-bearicons-outline-color-bearicons.png';
  static const _webIcon =
      'https://img.icons8.com/color/144/internet--v1.png';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (project.playStoreLink != null)
          _StoreButton(
            url: project.playStoreLink!,
            iconUrl: _playStoreIcon,
            tooltip: 'Play Store',
            iconSize: iconSize,
          ),
        if (project.appStoreLink != null)
          _StoreButton(
            url: project.appStoreLink!,
            iconUrl: _appStoreIcon,
            tooltip: 'App Store',
            iconSize: iconSize,
          ),
        if (project.apkLink != null)
          _StoreButton(
            url: project.apkLink!,
            iconUrl: _apkIcon,
            tooltip: 'APK',
            iconSize: iconSize,
          ),
        if (project.webLink != null || project.showWebIcon)
          _StoreButton(
            url: project.webLink,
            iconUrl: _webIcon,
            tooltip: 'Web',
            iconSize: iconSize,
          ),
      ],
    );
  }
}

class _StoreButton extends StatelessWidget {
  const _StoreButton({
    required this.url,
    required this.iconUrl,
    required this.tooltip,
    required this.iconSize,
  });

  final String? url;
  final String iconUrl;
  final String tooltip;
  final double iconSize;

  bool get _isEnabled => url != null && url!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _isEnabled
          ? () async {
              final uri = Uri.parse(url!);
              if (await canLaunchUrl(uri)) {
                await launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                );
              }
            }
          : null,
      tooltip: tooltip,
      icon: Image.network(iconUrl, width: iconSize, height: iconSize),
    );
  }
}
