import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.sizeOf(context).width
                : Responsive.isTablet(context)
                    ? MediaQuery.sizeOf(context).width / 1.2
                    : MediaQuery.sizeOf(context).width / 1.5,
            child: const Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                SkillCartWidget(
                  iconPath: 'https://img.icons8.com/color/144/flutter.png',
                  title: 'Flutter',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath: 'https://img.icons8.com/color/144/dart.png',
                  title: 'Dart',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/color/144/google-firebase-console.png',
                  title: 'Firebase',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/external-tal-revivo-color-tal-revivo/96/external-postman-is-the-only-complete-api-development-environment-logo-color-tal-revivo.png',
                  title: 'Postman',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/external-those-icons-flat-those-icons/96/external-Git-Logo-social-media-those-icons-flat-those-icons.png',
                  title: 'git',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath: 'https://img.icons8.com/3d-fluency/94/github.png',
                  title: 'Github',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath: 'https://img.icons8.com/color/144/gitlab.png',
                  title: 'Gitlab',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/sqlite/sqlite-icon.svg',
                  title: 'SqfLite',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/color/144/visual-studio-code-2019.png',
                  title: 'VS code',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/external-those-icons-flat-those-icons/96/external-Android-logos-and-brands-those-icons-flat-those-icons.png',
                  title: 'Android',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/color/144/android-studio--v2.png',
                  title: 'Android Studio',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/fluency/96/google-play-store-new.png',
                  title: 'Play Store',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/fluency/144/apple-app-store.png',
                  title: 'App Store',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/ios-filled/100/ios-logo.png',
                  title: 'iOS',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://img.icons8.com/external-those-icons-flat-those-icons/96/external-Linux-logos-and-brands-those-icons-flat-those-icons.png',
                  title: 'Linux',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath: 'https://img.icons8.com/color/144/mac-os-logo.png',
                  title: 'macOS',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath: 'https://img.icons8.com/fluency/144/windows-11.png',
                  title: 'Windows',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath: 'https://img.icons8.com/color/96/ubuntu--v1.png',
                  title: 'Ubuntu',
                  isSvg: false,
                ),
                SkillCartWidget(
                  iconPath: 'assets/hive.png',
                  title: 'Hive',
                  isSvg: false,
                  isLink: false,
                ),
                SkillCartWidget(
                  iconPath: 'assets/getx.png',
                  title: 'Getx',
                  isSvg: false,
                  isLink: false,
                ),
                SkillCartWidget(
                  iconPath: 'assets/provider.png',
                  title: 'Provider',
                  isSvg: false,
                  isLink: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
