import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCartWidget extends StatefulWidget {
  const ProjectCartWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.isSvg = true,
    this.isLink = true,
    this.playStoreLink,
    this.appStoreLink,
    this.githubLink,
    this.apkLink,
  });

  final String iconPath;
  final String title;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? githubLink;
  final String? apkLink;
  final bool isSvg;
  final bool isLink;

  @override
  State<ProjectCartWidget> createState() => _ProjectCartWidgetState();
}

class _ProjectCartWidgetState extends State<ProjectCartWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final showStores = _hovered ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(72),
            const SizedBox(height: 12),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
            ),
            const Spacer(),
            AnimatedOpacity(
              opacity: showStores ? 1 : 0,
              duration: const Duration(milliseconds: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.playStoreLink != null)
                    _StoreButton(
                      url: widget.playStoreLink!,
                      iconUrl:
                          'https://img.icons8.com/fluency/96/google-play-store-new.png',
                    ),
                  if (widget.appStoreLink != null)
                    _StoreButton(
                      url: widget.appStoreLink!,
                      iconUrl:
                          'https://img.icons8.com/fluency/144/apple-app-store.png',
                    ),
                  if (widget.apkLink != null)
                    _StoreButton(
                      url: widget.apkLink!,
                      iconUrl:
                          'https://img.icons8.com/external-bearicons-outline-color-bearicons/64/external-APK-file-extension-bearicons-outline-color-bearicons.png',
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(double size) {
    if (widget.isSvg) {
      return widget.isLink
          ? SvgPicture.network(
              widget.iconPath,
              height: size,
              width: size,
            )
          : SvgPicture.asset(
              widget.iconPath,
              height: size,
              width: size,
            );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        widget.iconPath,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _StoreButton extends StatelessWidget {
  const _StoreButton({required this.url, required this.iconUrl});

  final String url;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      icon: Image.network(iconUrl, width: 28, height: 28),
      tooltip: 'Open link',
    );
  }
}
