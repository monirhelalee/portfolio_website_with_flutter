import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  static const _sections = <({String title, List<_SkillData> skills})>[
    (
      title: 'Core',
      skills: [
        _SkillData(
          iconPath: 'https://img.icons8.com/color/144/flutter.png',
          title: 'Flutter',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/color/144/dart.png',
          title: 'Dart',
          isSvg: false,
        ),
      ],
    ),
    (
      title: 'State Management',
      skills: [
        _SkillData(
          iconPath:
              'https://raw.githubusercontent.com/felangel/bloc/master/extensions/intellij/intellij_generator_plugin/src/main/resources/META-INF/pluginIcon.svg',
          title: 'BLoC',
        ),
        _SkillData(
          iconPath: 'assets/getx.png',
          title: 'GetX',
          isSvg: false,
          isLink: false,
          isAsset: true,
        ),
        _SkillData(
          iconPath: 'assets/provider.png',
          title: 'Provider',
          isSvg: false,
          isLink: false,
          isAsset: true,
        ),
      ],
    ),
    (
      title: 'Backend & API',
      skills: [
        _SkillData(
          iconPath:
              'https://img.icons8.com/color/144/google-firebase-console.png',
          title: 'Firebase',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://socket.io/images/logo-dark.svg',
          title: 'Socket',
        ),
        _SkillData(
          iconPath:
              'https://img.icons8.com/external-tal-revivo-color-tal-revivo/96/external-postman-is-the-only-complete-api-development-environment-logo-color-tal-revivo.png',
          title: 'Postman',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://www.vectorlogo.zone/logos/sqlite/sqlite-icon.svg',
          title: 'SQLite',
        ),
        _SkillData(
          iconPath: 'assets/hive.png',
          title: 'Hive',
          isSvg: false,
          isLink: false,
          isAsset: true,
        ),
      ],
    ),
    (
      title: 'Tools & IDE',
      skills: [
        _SkillData(
          iconPath:
              'https://img.icons8.com/external-those-icons-flat-those-icons/96/external-Git-Logo-social-media-those-icons-flat-those-icons.png',
          title: 'Git',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/3d-fluency/94/github.png',
          title: 'Github',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/color/144/gitlab.png',
          title: 'Gitlab',
          isSvg: false,
        ),
        _SkillData(
          iconPath:
              'https://dam-cdn.atl.orangelogic.com/AssetLink/np0j8d765ebc4a778s3tdr6bc7avc301/fl_keep_metadata/logo-light_Bitbucket_mark-tile_inverse_RGB.svg',
          title: 'Bitbucket',
        ),
        _SkillData(
          iconPath:
              'https://img.icons8.com/color/144/visual-studio-code-2019.png',
          title: 'VS Code',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/color/144/cursor-ai.png',
          title: 'Cursor',
          isSvg: false,
        ),
        _SkillData(
          iconPath:
              'https://img.icons8.com/color/144/android-studio--v2.png',
          title: 'Android Studio',
          isSvg: false,
        ),
      ],
    ),
    (
      title: 'Platforms & Stores',
      skills: [
        _SkillData(
          iconPath:
              'https://img.icons8.com/external-those-icons-flat-those-icons/96/external-Android-logos-and-brands-those-icons-flat-those-icons.png',
          title: 'Android',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/ios-filled/100/ios-logo.png',
          title: 'iOS',
          isSvg: false,
        ),
        _SkillData(
          iconPath:
              'https://img.icons8.com/fluency/96/google-play-store-new.png',
          title: 'Play Store',
          isSvg: false,
        ),
        _SkillData(
          iconPath:
              'https://img.icons8.com/fluency/144/apple-app-store.png',
          title: 'App Store',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/color/144/internet--v1.png',
          title: 'Web',
          isSvg: false,
        ),
      ],
    ),
    (
      title: 'Operating Systems',
      skills: [
        _SkillData(
          iconPath:
              'https://img.icons8.com/external-those-icons-flat-those-icons/96/external-Linux-logos-and-brands-those-icons-flat-those-icons.png',
          title: 'Linux',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/color/144/mac-os-logo.png',
          title: 'macOS',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/fluency/144/windows-11.png',
          title: 'Windows',
          isSvg: false,
        ),
        _SkillData(
          iconPath: 'https://img.icons8.com/color/96/ubuntu--v1.png',
          title: 'Ubuntu',
          isSvg: false,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _sections.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.md),
          _SkillSection(
            title: _sections[i].title,
            skills: _sections[i].skills,
          ),
        ],
      ],
    );
  }
}

class _SkillSection extends StatelessWidget {
  const _SkillSection({
    required this.title,
    required this.skills,
  });

  final String title;
  final List<_SkillData> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          children: [
            for (final skill in skills)
              SkillCartWidget(
                iconPath: skill.iconPath,
                title: skill.title,
                isSvg: skill.isSvg,
                isLink: skill.isLink,
                isAsset: skill.isAsset,
              ),
          ],
        ),
      ],
    );
  }
}

class _SkillData {
  const _SkillData({
    required this.iconPath,
    required this.title,
    this.isSvg = true,
    this.isLink = true,
    this.isAsset = false,
  });

  final String iconPath;
  final String title;
  final bool isSvg;
  final bool isLink;
  final bool isAsset;
}
